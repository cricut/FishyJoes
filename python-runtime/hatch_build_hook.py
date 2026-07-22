# type: ignore
from hatchling.builders.hooks.plugin.interface import BuildHookInterface
import os

class CustomHook(BuildHookInterface):
    def initialize(self, version, build_data):
        platform_tag = os.environ.get('PY_PLATFORM_TAG')
        if platform_tag is not None:
            build_data["tag"] = f"py3-none-{platform_tag}"
