# AGENTS.md - Agent Guidelines for bash_gitlab_runners

## Project Overview

Bash shell scripts for deploying and managing GitLab CE and GitLab CI/CD runners on Ubuntu-based systems.

**Repository:** https://github.com/pgraffigna/bash_gitlab_runners

**Main Scripts:**
- `00-gitlab-ce_installer.sh` - Install GitLab CE
- `01-runners_installer.sh` - Install GitLab runners
- `03-deploy_runner.sh` - Register new runners

---

## Lint & Test Commands

### ShellCheck (Linting)

```bash
sudo apt install shellcheck
shellcheck *.sh                    # lint all scripts
shellcheck 00-gitlab-ce_installer.sh
shellcheck -S error *.sh            # errors only
```

### Bats (Testing)

```bash
sudo apt install bats
bats test/                         # run all tests
bats test/00-gitlab-ce_installer.bats  # single test file
bats test/file.bats -f "test name"      # specific test
```

---

## Code Style Guidelines

### Shebang
```bash
#!/usr/bin/env bash    # preferred
#!/bin/bash             # only if /bin/bash features needed
```

### Error Handling
```bash
set -e                                          # exit on first failure
trap ctrl_c INT; function ctrl_c(){ echo "Interrupted"; exit 0; }
command || { echo "Failed"; exit 1; }           # check return when set -e not used
```

### Variables
```bash
VERSION="18.7.5"              # constants: UPPERCASE
local output="/tmp/out.txt"   # locals: lowercase
sudo apt install -y "${pkg}" # always quote
```

### Functions
```bash
function function_name(){ :; }
# or
function_name() { :; }
```

### Color Output
```bash
VERDE="\e[0;32m\033[1m"; ROJO="\e[0;31m\033[1m"; AMARILLO="\e[0;33m\033[1m"; FIN="\033[0m\e[0m"
echo -e "${AMARILLO}=== Installing ===${FIN}"
```

### Comments
```bash
#!/usr/bin/env bash
# Autor: Pablo Graffigna
# URL: www.linkedin.com/in/pablo-graffigna

# === Section Name ===
```

### Indentation
- 4 spaces (not tabs)

### Command Syntax
```bash
sudo apt-get install --yes gitlab-ce    # long-form preferred
curl -sL "https://example.com" --output /tmp/file
wget -q "https://example.com" -O /tmp/file
```

### External Commands
```bash
command -v gitlab-runner >/dev/null 2>&1 || { echo "Not found"; exit 1; }
```

---

## GitLab Runner Configuration

### Registering Runners

```bash
gitlab-runner register --non-interactive \
  --url ${GITLAB_URL} \
  --registration-token ${TOKEN} \
  --executor docker \
  --docker-image ${DOCKER_IMAGE} \
  --name "runner-${RANDOM}" \
  --docker-pull-policy always \
  --locked=false \
  --run-untagged=false
```

- Use `sample-config.toml` as template
- Place in `/etc/gitlab-runner/config.toml` on runner

---

## Best Practices

1. **Idempotency**: Scripts safe to run multiple times
2. **Error messages**: Clear and actionable
3. **Logging**: Color-coded output
4. **Cleanup**: Remove temp files
5. **Permissions**: `chmod +x` on executables
6. **Quotes**: Always quote variables
7. **Secrets**: Never hardcode tokens; use environment variables

---

## Cursor/Copilot Rules

None exist (no `.cursor/rules/`, `.cursorrules`, or `.github/copilot-instructions.md`).

---

## Additional Notes

- **Bash shell scripting project** - no build step required
- Test in VM (Vagrant) before production
- Scripts follow naming: `XX-name.sh` where XX is order number
