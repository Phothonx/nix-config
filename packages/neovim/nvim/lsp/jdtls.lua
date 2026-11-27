---@type vim.lsp.Config
return {
  -- jdtls derives its workspace dir from a hash of the cwd basename; key it on the
  -- project root instead, so two projects never share (and lock) the same index.
  cmd = function(dispatchers, config)
    local root = config.root_dir or vim.fn.getcwd()
    local data = vim.fn.stdpath('cache') .. '/jdtls/' .. vim.fn.sha256(root):sub(1, 16)
    return vim.lsp.rpc.start({ 'jdtls', '-data', data }, dispatchers, { cwd = root })
  end,
  filetypes = { 'java' },
  root_markers = {
    { 'pom.xml', 'build.gradle', 'build.gradle.kts', 'settings.gradle', 'settings.gradle.kts', 'mvnw', 'gradlew' },
    -- course TDs have no build file, only a Makefile: make each TD its own project
    -- instead of falling back to the repo's .git (duplicate packages across TDs)
    'Makefile',
    '.git',
  },
  settings = {
    java = {
      -- only used for projects without Maven/Gradle (jdtls "invisible projects")
      project = {
        sourcePaths = { 'src', 'test' },
        referencedLibraries = { 'lib/**/*.jar', '*.jar' },
      },
    },
  },
}
