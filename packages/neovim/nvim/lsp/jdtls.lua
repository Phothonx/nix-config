---@type vim.lsp.Config
return {
  cmd = {
    'jdtls',
    -- jdtls derives its workspace dir from a hash of the cwd *basename*, so two
    -- projects sharing a folder name would collide on one index; key it on the
    -- full path instead.
    '-data',
    vim.fn.stdpath('cache') .. '/jdtls/' .. vim.fn.sha256(vim.fn.getcwd()):sub(1, 16),
  },
  filetypes = { 'java' },
  root_markers = {
    'pom.xml',
    'build.gradle',
    'build.gradle.kts',
    'settings.gradle',
    'settings.gradle.kts',
    'mvnw',
    'gradlew',
    '.git',
  },
}
