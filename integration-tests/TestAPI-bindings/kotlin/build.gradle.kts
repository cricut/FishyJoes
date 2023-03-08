import org.jetbrains.kotlin.konan.properties.loadProperties
import org.gradle.api.tasks.testing.logging.TestExceptionFormat

plugins {
    `maven-publish`
    kotlin("jvm") version "1.6.21"
    jacoco
}

repositories {
    mavenLocal()
    mavenCentral()
    maven {
        name = "GitHubPackagesSwiftRuntime"
        url = uri("https://maven.pkg.github.com/cricut/android-swift-runtime")
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

publishing {
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

    jvmArgs(
//        "-Xcheck:jni",
        "-XX:+SuppressFatalErrorMessage",
    )
    testLogging {
        exceptionFormat = TestExceptionFormat.FULL
        events("started", "skipped", "passed", "failed", "standardOut", "standardError")
        showStandardStreams = true
    }
}

tasks.jacocoTestReport {
    reports {
        xml.required.set(true)
    }
}

jacoco {
    toolVersion = "0.8.8"
    reportsDirectory.set(layout.projectDirectory.dir("../../../coverage-data/jacoco-integration"))
}

tasks {
    compileKotlin {
        kotlinOptions.jvmTarget = "1.8"
    }
    compileTestKotlin {
        kotlinOptions.jvmTarget = "1.8"
    }
}

dependencies {
    implementation(kotlin("stdlib:1.6.21"))
    api("com.cricut.fishyjoes:runtime:local")
    testImplementation("org.junit.jupiter:junit-jupiter-api:5.8.2")
    testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine:5.8.2")
}
