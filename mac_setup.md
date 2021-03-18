# MacOS Instructions

This guide provides instructions for setting up your Buble development environment on for MacOS. 

## System Requirements

- **MacOS Version 10.12** or later
- 8 GB or more RAM
- 10 GB or more free disk space
- Intel-based mac (no M-1 mac support for docker yet)

## Installing Docker

**Note:** Creating a DockerHub account is not required to install and use Docker. 

1. Download **Docker for Mac** <a href="https://download.docker.com/mac/stable/Docker.dmg" _target="blank">here</a>.
2. Install Docker from the `.dmg` file you just downloaded.
3. Open the Docker application.
4. If prompted, continue opening Docker and provide the password you use to log into your Mac.
5. The status bar at the top-right of your screen should have a Docker whale icon in it.
6. Click on the Docker whale icon to check that "**Docker Desktop is running**".
7. Then, if you wish, click "**Preferences...**" and ensure that:
    - "**Start Docker Desktop when you log in**" is _checked_ and
    - "**Automatically check for updates**" is _unchecked_.


## Getting the Environment Installer

1. Download the installation files <a href="https://github.com/MLSandoval/buble-dev-env/archive/master.zip" target="_blank">here</a>.
2. Move the downloaded `buble-dev-env-master.zip` file to your Desktop and open it.
3. Rename the unzipped folder to `buble-env`.

---

## Setting Up the Environment

1. Open a new Terminal window.
2. Paste the following command into your Terminal and press `Enter`. Installation will take a few moments.
    ```bash
    bash ~/Desktop/buble-env/dev-env/mac_scripts/install.bash
    ```
3. Once installation is complete, you may close Terminal.

---

## Entering and Exiting the Development Environment

1. Type `buble-dev` and press enter. Your prompt should change to `~ µ`.
2. Type `exit` and press `Enter` to exit the development environment and return to your normal Terminal session .
3. To return to the development environment, type `buble-dev` and press `Enter`.

---

## Configure Git

This Ubuntu development environment is a Docker container instance, composed from a Docker image, which operates separately from your host Mac. Due to this, you will need to configure Git for your image. You will be required to enter your Github login credentials the *first* time you push or pull a branch, *each* time you run a new Docker container instance.

1. Be sure that you are in your development environment. This command should output **`dev`**.

    ```bash
    whoami
    ```

2. Set up your personal information for Git. Replace the example **name** and **email** address with your own. The email you use should be the same email you registered with GitHub.

    ```bash
    git config --global user.name "Galbi Jim"
    git config --global user.email "galbi.jim@buble.com"
    ```

3. Confirm that your settings were saved with the following command:

    ```bash
    git config --global --list
    ```

---

## Testing Your Environment

The following steps are to ensure proper installation.

1. Within your development environment, type the following command, and press `Enter`.
    ```shell
    sudo service postgresql start
    ```

2. Next, type the following command and press `Enter`.
    ```shell
    pgweb
    ```

3. Open your web browser and go to `http://localhost:8081`. You should see the `pgweb` tool in your browser.

4. When you have verified that `pgweb` loads, go back to **Terminal** and press `Ctrl + C` to quit `pgweb`.

---

## Done!

Your development environment is ready! Here are some additional commands you may find helpful:

- `sudo service postgresql start`
  - Begin running your local PostgreSQL development database. May also replace `start` with `stop` or `status`. May Run concurrently with `redis-server`.

- `psql`
  - Requires `PostgreSQL` service to be running, this will grant access to your `PostgreSQL` database via the command line.

- `sudo -u postgres psql`
  - Run `PostgreSQL` as the super user `postgres`. Necessary when changing `PostgreSQL` configuration options, and other more complex `PostgreSQL` functions.

- `pgweb`
  - Begin running pgweb browser-based admin tool. Go to `http://localhost:8081` to access. Can asist with quickly writing and testing queries, along with syntax validation for `PostgreSQL`.

- `redis-server`
  - Begin running your local development `redis-server`. May run concurrently with `PostgreSQL`. `CTRL + C` to stop running.

- `buble-dev-stop`
  - Must be run from a shell *outside* your dev environment. Stop the Docker container instance from continuing to run. You may also quit Docker from running the background, helpful if you need to free up computer resources.

- `buble-dev-uninstall`
  - Must be run from a shyell *outside* your dev environment. Completely uninstall the Buble development environment and all related directories. This will also delete the Docker image from your Docker application. Useful if your installation is corrupted, or if you are done developing for Buble.

- `exit`
  - Exit the current Docker container instance and return terminal to host mac control.
