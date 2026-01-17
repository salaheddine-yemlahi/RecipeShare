// Root build.gradle.kts for Flutter + Firebase (Kotlin DSL)

buildscript {

    // These repositories are required for classpath dependencies
    repositories {
        google()
        mavenCentral()
    }

    // Firebase Google Services plugin (Kotlin DSL syntax)
    dependencies {
        classpath("com.google.gms:google-services:4.4.0")
    }
}

// Repositories for all subprojects (app module, plugins, etc.)
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Flutter custom build directory setup
val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()

rootProject.layout.buildDirectory.value(newBuildDir)

// Apply new build dir for each subproject
subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// Make sure :app is evaluated first
subprojects {
    project.evaluationDependsOn(":app")
}

// Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
