// __AUTOGEN_WARNING__
import { defineConfig } from 'vitest/config'

// Required so SharedArrayBuffer is available — the worker-threads runtime depends on it.
const crossOriginIsolationHeaders = {
  'Cross-Origin-Opener-Policy': 'same-origin',
  'Cross-Origin-Embedder-Policy': 'require-corp',
}

export default defineConfig({
  resolve: {
    alias: {
      '__MODULE_NAME__': '@cricut/__LOWERCASE_MODULE_NAME__-wasm',
    },
  },
  // Don't prebundle the wasm package — we need Vite to honor its `browser` field
  // (__MODULE_NAME__.browser.js) and serve __MODULE_NAME__.wasm / __MODULE_NAME__.worker.js as static assets.
  optimizeDeps: {
    exclude: ['@cricut/__LOWERCASE_MODULE_NAME__-wasm'],
  },
  server: {
    headers: crossOriginIsolationHeaders,
    fs: {
      // The @cricut/__LOWERCASE_MODULE_NAME__-wasm dependency is installed via a `file:` link to
      // ../generated/packages/wasm/, which resolves outside the test project root.
      // Allow Vite to serve the wasm + worker assets from there.
      allow: ['..', '../..'],
    },
  },
  preview: {
    headers: crossOriginIsolationHeaders,
  },
  test: {
    globals: true,
    include: ['*.test.ts'],
    setupFiles: ['generated/vitest.setup.wasm-browser.ts'],
    browser: {
      enabled: true,
      provider: 'playwright',
      name: 'chromium',
      headless: true,
      // Don't leave behind __screenshots__/ PNGs when tests fail.
      screenshotFailures: false,
      api: {
        headers: crossOriginIsolationHeaders,
      },
    },
  },
})
