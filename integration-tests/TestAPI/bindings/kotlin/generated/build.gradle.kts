import org.jetbrains.kotlin.konan.properties.loadProperties
import org.gradle.api.tasks.testing.logging.TestExceptionFormat

// version info comes from https://github.com/cricut/Platform-Documentation/blob/main/platform/version_documentation.md#android
plugins {
    `maven-publish`
    kotlin("jvm") version "1.9.10"
    jacoco
}

repositories {
    mavenLocal()
    mavenCentral()
    maven {
        name = "GitHubPackagesFishyJoes"
        url = uri("https://maven.pkg.github.com/cricut/FishyJoes")
        credentials {
            username = if ((System.getenv("GITHUB_USER") ?: "") != "") System.getenv("GITHUB_USER") else project.property("gpr_user") as String
            password = if ((System.getenv("GITHUB_TOKEN") ?: "") != "") System.getenv("GITHUB_TOKEN") else project.property("gpr_key") as String
        }
    }
}

val sourcesJar by tasks.registering(Jar::class) {
    archiveClassifier.set("sources")
    from(sourceSets.main.get().allSource)
    exclude("**/*.so", "**/*.dylib", "**/*.dll")
}

gradle.rootProject {
    tasks.register("updateVersion") {
        if (System.getenv("VERSION") != null) {
            println("setting property to " + System.getenv("VERSION"))
            val properties = loadProperties("gradle.properties")
            properties.load(project.rootProject.file("gradle.properties").inputStream())
            properties.setProperty("version", System.getenv("VERSION"))

            val outputStream = project.rootProject.file("gradle.properties").outputStream()
            properties.store(outputStream, "set version: ${System.getenv("VERSION")}")
            outputStream.flush()
            outputStream.close()
        }
    }
}

publishing {
    repositories {
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.__BINDINGS_REPO__")
            credentials {
                username = System.getenv("GITHUB_ACTOR")
                password = System.getenv("GITHUB_PUBLISH_TOKEN")
            }
        }
    }
    publications {
        create<MavenPublication>("mavenJava") {
            groupId = properties["group"] as? String
            artifactId = properties["artifact"] as? String
            version = properties["version"] as? String

            from(components["java"])
            artifact(sourcesJar.get())
        }
    }
}

sourceSets.main {
    java.srcDir("src/generated/kotlin")
    resources.srcDir("src/generated/resources")
}

tasks.test {
    useJUnitPlatform()
    jvmArgs("-Xcheck:jni", "-XX:+SuppressFatalErrorMessage")
    testLogging {
        exceptionFormat = TestExceptionFormat.FULL
        events("started", "skipped", "passed", "failed" , "standardOut", "standardError")
        showStandardStreams = true
    }
}

tasks.jacocoTestReport {
    reports.xml.required.set(true)
}
jacoco {
    toolVersion = "0.8.10"
    System.getenv("JACOCO_COVERAGE_PATH")?.let { reportsDirectory.set(layout.buildDirectory.dir(it)) }
}

tasks {
    compileKotlin {
        kotlinOptions.jvmTarget = "11"
    }
    compileTestKotlin {
        kotlinOptions.jvmTarget = "11"
    }
    compileJava {
        sourceCompatibility = JavaVersion.VERSION_11.toString()
        targetCompatibility = JavaVersion.VERSION_11.toString()
    }
    compileTestJava {
        sourceCompatibility = JavaVersion.VERSION_11.toString()
        targetCompatibility = JavaVersion.VERSION_11.toString()
    }
}

dependencies {
    implementation(kotlin("stdlib:1.9.10"))
    testImplementation("org.junit.jupiter:junit-jupiter-api:5.8.2")
    testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine:5.8.2")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.3")
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.3")
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.7.3")

    api("com.cricut.fishyjoes:runtime:local")
}
