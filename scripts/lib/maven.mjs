#!/usr/bin/env zx
import { exitWithError } from "./utils.mjs";

export async function bumpMaven(level = "patch") {
  const oldVersion = await getVersionMaven();
  let [major, minor, patch] = oldVersion.split(".").map((n) => parseInt(n));
  let newVersion;
  switch (level) {
    case "patch":
      newVersion = `${major}.${minor}.${patch + 1}`;
      break;
    case "minor":
      newVersion = `${major}.${minor + 1}.${0}`;
      break;
    case "major":
      newVersion = `${major + 1}.${0}.${0}`;
      break;
    default:
      console.log("No version bump");
      break;
  }
  try {
    const { exitCode, stderr } =
      await $`sed -i -e "s/${oldVersion}/${newVersion}/g" pom.xml`;
    if (exitCode !== 0) {
      exitWithError(stderr);
    }
    return newVersion;
  } catch (error) {
    exitWithError(error.stderr);
  }
}

export async function getVersionMaven() {
  try {
    const { stdout, exitCode, stderr } =
      await $`grep "<version>" pom.xml | head -1`;
    if (exitCode !== 0) {
      exitWithError(stderr);
    }
    const version = stdout.trim().split("</version>")[0].replace("<version>", "");
    return version;
  } catch (error) {
    exitWithError(error.stderr);
  }
}

export async function buildJarMaven() {
  try {
    const { stdout, exitCode, stderr } = await $`mvn clean install`;
    if (exitCode !== 0) {
      exitWithError(stderr);
    }
    console.log(stdout.trim());
  } catch (error) {
    exitWithError(error.stderr);
  }
}
