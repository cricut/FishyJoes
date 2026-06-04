// __AUTOGEN_WARNING__

import module from "__MODULE_NAME__";

const cleanupRegistered = "__MODULE_NAME__.fishyjoesCleanupRegistered";
const globalWithCleanupFlag = globalThis as typeof globalThis & Record<string, boolean | undefined>;

if (!globalWithCleanupFlag[cleanupRegistered]) {
  globalWithCleanupFlag[cleanupRegistered] = true;
  process.once("exit", () => {
    (module as { __fishyjoesCleanup?: () => void }).__fishyjoesCleanup?.();
  });
}
