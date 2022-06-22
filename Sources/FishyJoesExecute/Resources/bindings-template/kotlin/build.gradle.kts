import org.jetbrains.kotlin.konan.properties.loadProperties
import org.gradle.api.tasks.testing.logging.TestExceptionFormat

plugins {
    `maven-publish`
    kotlin("jvm") version "1.6.21"
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
        events("started", "skipped", "passed", "failed")
        showStandardStreams = true
    }
}

tasks {
    compileKotlin {
        kotlinOptions.jvmTarget = "1.8"
    }
    compileTestKotlin {
        kotlinOptions.jvmTarget = "1.8"
    }
}

// Read what version of the fishy joes runtime to use directly out of the swift definition, so we don't get out of sync
fun readFishyJoesVersion(): String {
    val packageText = rootProject.file("../Package.swift").readText()
    val pattern = Regex("^\\s*let\\s+fishyJoesVersion\\s*=\\s*\"([.0-9]*)\"\\s*$", RegexOption.MULTILINE)
    val match = pattern.find(packageText)
    val version = match?.groups?.get(1)?.value
    if (version == null) {
        logger.error("Could not read FishyJoes version from Package.swift. Check format.")
        return "unknown"
    }
    return version
}

dependencies {
    implementation(kotlin("stdlib:1.6.21"))
    api("com.cricut.fishyjoes:runtime:${readFishyJoesVersion()}")
    testImplementation("org.junit.jupiter:junit-jupiter-api:5.8.2")
    testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine:5.8.2")
}
