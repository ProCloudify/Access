Here's a `README.md` file for your GitHub repository that explains how to use the `setup-ssh.sh` script:


# Server Setup

This repository contains a collection of server setup scripts, including configuration for SSH keys and other server-related utilities. The primary script is `setup-ssh.sh`, which automates the process of adding SSH public keys to a server.

## `setup-ssh.sh`

The `setup-ssh.sh` script is designed to add an SSH public key to the `~/.ssh/authorized_keys` file on your server. It ensures that the server is properly configured to allow passwordless SSH login using the provided key.

### Features:
- Adds an SSH public key to the server's `~/.ssh/authorized_keys` file.
- Creates the `.ssh` directory if it doesn't exist.
- Ensures the proper permissions for the `.ssh` directory and the `authorized_keys` file.

## Usage

### Home PC

You can directly download and run the script on your server using the following `curl` command:

```bash
curl -sSL https://raw.githubusercontent.com/ProCloudify/Access/refs/heads/main/setup-ssh.sh | bash
```

### OFFICE DESK

Alternatively, you can use `wget` to download and run the script:

```bash
curl -sSL https://raw.githubusercontent.com/ProCloudify/Access/refs/heads/main/office-ssh.sh | bash
```


### Explanation:
1. **Overview of the repository**: Describes the repository's purpose and the functionality of the main script.
2. **Usage**: Explains how to use the script, both through direct execution via `curl` or `wget`, and manually.
3. **Requirements**: Lists prerequisites for running the script.
4. **License**: Suggests using the MIT License, but feel free to adjust it if necessary.
