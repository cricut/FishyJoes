// __AUTOGEN_WARNING__

import module from "__MODULE_NAME__";

afterAll(() => {
  (module as { __fishyjoesCleanup?: () => void }).__fishyjoesCleanup?.();
});
