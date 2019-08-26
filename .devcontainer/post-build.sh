#!/bin/bash
# Update to .NET Core SDK 2.2.401.
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 2.2.401
# Add the appropriate paths to $PATH through the bash profile.
cat << \EOF >> ~/.bash_profile
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools:$HOME/.local/bin:$PATH"
EOF
# Apply the bash profile now, to make sure we override any existing .NET Core installations.
source ~/.bash_profile

# Install PowerShell as a global tool.
dotnet tool install -g PowerShell

# Install LaTeX.
sudo apt-get update && \
sudo apt-get install -y texlive \
                        texlive-latex-recommended \
                        texlive-latex-extra \
                        texlive-fonts-extra \
                        texlive-publishers \
                        texlive-science \
                        latexmk
