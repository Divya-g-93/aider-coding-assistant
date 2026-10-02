# Local Coding Assistant with Aider

A setup guide for developers to use an AI coding assistant locally with Ollama and Aider on their own machines.

**Purpose:** Code explanation, architecture understanding, workflow analysis, test generation, troubleshooting, and local project analysis without exposing code to external services.

**Privacy:** All processing happens locally. Project files never leave your machine. Code and conversations stay on your workstation.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Option A: Automated Setup (Recommended)](#option-a-automated-setup-recommended)
3. [Option B: Manual Setup](#option-b-manual-setup)
4. [How to Use Aider](#how-to-use-aider)
5. [Troubleshooting](#troubleshooting)
6. [FAQ](#faq)

---

## Prerequisites

- **Windows 10** or later
- **Git** (to clone this repo)
- **Ollama** (local LLM runtime)
- **At least one model** pulled in Ollama

---

## Option A: Automated Setup (Recommended)

This is the fastest way to get started. The batch script automates all installations and checks.

### Step 1: Clone or Download This Repository

```bash
git clone https://github.com/Divya-g-93/aider-coding-assistant.git
cd aider-coding-assistant
```

Or download as ZIP and extract.

### Step 2: Install Ollama (if not already installed)

1. Download Ollama from https://ollama.com/
2. Run the installer
3. Start Ollama (it will run in the background)
4. Pull a coding model:

```bash
ollama pull qwen2.5-coder:3b
```

Or:

```bash
ollama pull qwen2.5-coder:1.5b
```

### Step 3: Run the Setup Script

**Option A1: Using Command Prompt (cmd)**

1. Open **Command Prompt**
2. Navigate to the repo folder:

```bash
cd C:\path\to\aider-coding-assistant
```

3. Run the installer script:

```bash
scripts\install_aider_windows.bat
```

The script will:
- ✅ Check if Python is installed
- ✅ Verify Python version is 3.10+
- ✅ Upgrade pip
- ✅ Install Aider (if not already installed)
- ✅ Check Ollama is running
- ✅ Verify models are available

4. Wait for the script to complete. When it says "Setup completed successfully", you're ready to use Aider!

**Option A2: Using Git Bash**

1. Open **Git Bash**
2. Navigate to the repo folder:

```bash
cd /c/Users/YourUsername/aider-coding-assistant
```

3. Run the installer script:

```bash
./scripts/install_aider_windows.bat
```

Or run it directly from cmd:

```bash
bash -c "scripts/install_aider_windows.bat"
```

### Step 4: Start Aider for Your Project

Once the setup script completes successfully, you can start Aider for any project:

```bash
scripts\start_aider.cmd "C:\path\to\your\project"
```

Replace `C:\path\to\your\project` with the actual path to your project folder.

**Example:**

```bash
scripts\start_aider.cmd "C:\Users\Divya\Projects\my-app"
```

You will be prompted to select a model. Press Enter to use the default (`qwen2.5-coder:3b`), or type a different model name.

Aider will start and show:

```
Aider v0.x.x
Model: ollama/qwen2.5-coder:3b
Repo: C:\Users\Divya\Projects\my-app

>
```

---

## Option B: Manual Setup

If you prefer to install components manually or the automated script fails, follow these steps.

### Step 1: Install Python 3.10+

1. **Download Python:**
   - Go to https://www.python.org/downloads/
   - Click **Download Python 3.12** (latest stable version)
   - Save the installer (.exe file)

2. **Run the Installer:**
   - Double-click the downloaded `.exe`
   - **IMPORTANT:** Check the box ✅ **"Add Python to PATH"**
   - Click **"Install Now"**
   - Wait for installation to complete

3. **Verify Installation:**
   - Open **Command Prompt**
   - Type:

   ```bash
   python --version
   ```

   - You should see: `Python 3.12.x` (or your installed version)

   If you see "command not found", restart your computer and try again.

### Step 2: Upgrade pip

Open **Command Prompt** and run:

```bash
python -m pip install --upgrade pip
```

### Step 3: Install Aider

In **Command Prompt**, run:

```bash
pip install aider-chat
```

**Wait for it to complete.** It will install Aider and all dependencies.

**Verify Installation:**

```bash
aider --version
```

Should display: `aider v0.x.x`

### Step 4: Install Ollama

1. Download from https://ollama.com/
2. Run the installer
3. Click "Install"
4. Start the Ollama application

### Step 5: Pull a Local Model

Open **Command Prompt** and run:

```bash
ollama pull qwen2.5-coder:3b
```

This downloads a ~2GB model file. **This may take 5-20 minutes** depending on your internet speed.

Alternatively, use a smaller model:

```bash
ollama pull qwen2.5-coder:1.5b
```

Or:

```bash
ollama pull mistral
```

### Step 6: Verify Ollama is Running

Open **Command Prompt** and run:

```bash
curl http://127.0.0.1:11434/api/tags
```

**Expected output:**

```json
{"models":[{"name":"qwen2.5-coder:3b","modified_at":"...","size":...}]}
```

If you see an error, start the Ollama application and try again.

### Step 7: Start Aider on Your Project

Navigate to your project folder and run:

```bash
cd C:\path\to\your\project
aider --model ollama/qwen2.5-coder:3b
```

Replace the model name if you pulled a different one.

---

## How to Use Aider

Once Aider starts, you'll see an interactive prompt:

```
>
```

Type commands to interact with your code:

### Common Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `/ask` | Ask about your code (read-only) | `/ask Explain the authentication flow` |
| `/code` | Ask Aider to modify code | `/code Add input validation to login function` |
| `/test` | Generate tests | `/test` |
| `/help` | Show all available commands | `/help` |
| `exit` | Exit Aider | `exit` |

### Example Prompts

```text
/ask What is the overall architecture of this project?

/ask Explain how the payment module works.

/ask Generate unit tests for the UserService class.

/ask I'm getting "TypeError: undefined is not a function" on line 45. What's wrong?

/code Add error handling to the main function.

/test Generate tests for the authentication module.
```

### Key Features

- **Project Context:** Aider understands your entire project structure
- **Code Modification:** You can ask Aider to modify code; it proposes changes you can review and accept
- **Multi-turn Conversations:** Continue asking follow-up questions
- **Local Only:** Your code never leaves your machine

---

## Troubleshooting

### Issue 1: "python: command not found" or "python is not recognized"

**Cause:** Python is not installed or not in your system PATH.

**Solution:**

1. **Install Python 3.12:**
   - Download from https://www.python.org/downloads/
   - Run the installer
   - **IMPORTANT:** Check ✅ "Add Python to PATH"

2. **Restart your computer** (important!)

3. **Verify in Command Prompt:**

   ```bash
   python --version
   ```

4. If still not found, manually add Python to PATH:
   - Open **Settings** → **Environment Variables**
   - Add `C:\Users\YourUsername\AppData\Local\Programs\Python\Python312` to PATH
   - Restart Command Prompt

---

### Issue 2: "Python 3.10+ required" or version error

**Cause:** Python version is too old.

**Solution:**

1. Uninstall current Python:
   - **Settings** → **Apps** → **Apps & features** → Find Python → **Uninstall**

2. Install Python 3.12:
   - Download from https://www.python.org/downloads/
   - Run installer with ✅ "Add Python to PATH"

3. Restart your computer

4. Verify:

   ```bash
   python --version
   ```

---

### Issue 3: "aider: command not found" after installation

**Cause:** pip installation wasn't successful or pip is not in PATH.

**Solution:**

1. Reinstall Aider:

   ```bash
   pip install --upgrade aider-chat
   ```

2. If that fails, try:

   ```bash
   python -m pip install aider-chat
   ```

3. Restart Command Prompt (important!)

4. Verify:

   ```bash
   aider --version
   ```

---

### Issue 4: "Cannot install packages due to OSError" with long file paths

**Cause:** Windows Long Path support is not enabled (usually happens with Python 3.14).

**Solution:**

1. **Enable Long Path Support:**
   - Open **Command Prompt as Administrator**
   - Run this command:

   ```bash
   reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v LongPathsEnabled /d 1 /f
   ```

2. **Restart your computer**

3. **Try installation again:**

   ```bash
   pip install aider-chat
   ```

**Alternative:** Downgrade to Python 3.12 (recommended):
- Uninstall Python 3.14
- Install Python 3.12
- Retry installation

---

### Issue 5: Batch Script Fails to Run

**Cause:** Script execution is blocked or Windows security policies prevent it.

**Solution Option 1: Run as Administrator**

1. Right-click on **Command Prompt**
2. Select **"Run as Administrator"**
3. Navigate to repo folder:

   ```bash
   cd C:\path\to\aider-coding-assistant
   ```

4. Run the script:

   ```bash
   scripts\install_aider_windows.bat
   ```

**Solution Option 2: Change Execution Policy (Advanced)**

1. Open **PowerShell as Administrator**
2. Run:

   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

3. Type `Y` and press Enter
4. Now try running the batch script

**Solution Option 3: Use Git Bash Instead**

1. Open **Git Bash**
2. Navigate to repo:

   ```bash
   cd /c/Users/YourUsername/aider-coding-assistant
   ```

3. Run script:

   ```bash
   bash -c "scripts/install_aider_windows.bat"
   ```

---

### Issue 6: "Ollama is installed but not running"

**Cause:** Ollama service is not active.

**Solution:**

1. **Start Ollama:**
   - Open the **Ollama** application from Start menu
   - Wait for it to show "Running" (usually in system tray)

2. **Verify it's running:**
   - Open Command Prompt
   - Run:

   ```bash
   curl http://127.0.0.1:11434/api/tags
   ```

   - If you see model data, Ollama is running

3. **If still not working:**
   - Restart Ollama application
   - Check if port 11434 is available (no other app using it)

---

### Issue 7: "Ollama model not found"

**Cause:** No models have been pulled into Ollama.

**Solution:**

1. Pull a model:

   ```bash
   ollama pull qwen2.5-coder:3b
   ```

2. Wait for download to complete (5-20 minutes depending on internet)

3. Verify:

   ```bash
   ollama list
   ```

   You should see the model listed.

4. Now run Aider with that model:

   ```bash
   aider --model ollama/qwen2.5-coder:3b
   ```

---

### Issue 8: "Cannot reach Ollama" error in Aider

**Cause:** Aider can't connect to Ollama on port 11434.

**Solution:**

1. **Ensure Ollama is running:**
   - Start Ollama application

2. **Check connection:**

   ```bash
   curl http://127.0.0.1:11434/api/tags
   ```

3. **If port is blocked:**
   - Restart your computer
   - Disable firewall temporarily to test
   - If that fixes it, add Ollama to firewall exceptions

4. **If Ollama is on a different machine:**

   ```bash
   aider --model ollama/qwen2.5-coder:3b --ollama-base-url http://192.168.1.100:11434
   ```

   Replace IP with the machine running Ollama.

---

### Issue 9: Batch Script Gets Stuck or Hangs

**Cause:** pip installation or download is taking too long.

**Solution:**

1. **Press Ctrl+C** to stop the script
2. **Wait a few minutes** (sometimes the script is still downloading)
3. **Try manual installation:**

   ```bash
   pip install --upgrade setuptools
   pip install aider-chat
   ```

4. **Check internet connection** (sometimes downloads fail silently)

5. **If all else fails, use Python 3.12** (not 3.14 or 3.13)

---

### Issue 10: "pip install" command takes very long or fails

**Cause:** Network issues or dependency conflicts.

**Solution:**

1. **Clear pip cache:**

   ```bash
   pip cache purge
   ```

2. **Upgrade pip:**

   ```bash
   python -m pip install --upgrade pip
   ```

3. **Try installation with verbose output:**

   ```bash
   pip install -v aider-chat
   ```

   This shows what's happening step by step.

4. **Use a specific index (if default is slow):**

   ```bash
   pip install -i https://pypi.org/simple/ aider-chat
   ```

5. **If still failing, try installing dependencies manually:**

   ```bash
   pip install --upgrade setuptools wheel
   pip install aider-chat
   ```

---

## FAQ

### Q1: Is my code secure? Does it get sent to external services?

**A:** Yes, completely secure. All code stays on your machine. Aider communicates only with your local Ollama instance on `127.0.0.1:11434`. Nothing is uploaded to cloud services or used for training.

---

### Q2: Can I use this offline?

**A:** Yes! Once Ollama and the model are installed and downloaded, you can run Aider completely offline. No internet connection needed.

---

### Q3: Which model should I use?

**A:** 

- **qwen2.5-coder:1.5b** — Fast, lightweight (~1 GB), good for explanations
- **qwen2.5-coder:3b** — Balanced performance and quality (~2 GB), recommended
- **mistral** — More powerful (~4 GB), slower but better for complex tasks

Start with `qwen2.5-coder:3b` if unsure.

---

### Q4: Can I run this on macOS or Linux?

**A:** The batch scripts are Windows-specific. For macOS/Linux:

1. Install Python 3.10+
2. Install Ollama
3. Run: `pip install aider-chat`
4. Pull a model: `ollama pull qwen2.5-coder:3b`
5. Start Aider: `aider --model ollama/qwen2.5-coder:3b`

The same steps apply; just no `.bat` file needed.

---

### Q5: How do I uninstall Aider?

**A:**

```bash
pip uninstall aider-chat
```

This removes Aider but keeps Python and Ollama.

---

### Q6: Can multiple people use the same Ollama instance?

**A:** Yes! If Ollama runs on a shared machine or server, multiple developers can point to it:

```bash
aider --model ollama/qwen2.5-coder:3b --ollama-base-url http://shared-server-ip:11434
```

---

### Q7: How do I update Aider to the latest version?

**A:**

```bash
pip install --upgrade aider-chat
```

---

### Q8: What if I need help with Aider itself?

**A:** 

- Type `/help` inside Aider for command reference
- Visit https://aider.chat/ for documentation
- Check the Aider GitHub: https://github.com/paul-gauthier/aider

---

### Q9: How much disk space do I need?

**A:**

- Python: ~200 MB
- Aider: ~100 MB
- Model (qwen2.5-coder:3b): ~2 GB
- Model (qwen2.5-coder:1.5b): ~1 GB

**Total: ~3-4 GB minimum**

---

### Q10: Can I run multiple Aider instances at the same time?

**A:** Yes, each Aider instance can analyze different projects. They all use the same Ollama instance.

---

## Support

If you encounter issues:

1. **Check Troubleshooting** section above
2. **Verify all prerequisites** are installed
3. **Ensure Ollama is running** before starting Aider
4. **Restart your computer** (fixes many issues!)
5. **Use Python 3.12** (most stable version)

---

## License

This project is provided for local developer use.

---

## Quick Reference

| Task | Command |
|------|---------|
| Install everything | `scripts\install_aider_windows.bat` |
| Start Aider | `scripts\start_aider.cmd "C:\path\to\project"` |
| Check Python | `python --version` |
| Check Aider | `aider --version` |
| Check Ollama | `curl http://127.0.0.1:11434/api/tags` |
| Pull a model | `ollama pull qwen2.5-coder:3b` |
| List models | `ollama list` |
| Inside Aider: ask | `/ask Explain this function` |
| Inside Aider: code | `/code Add error handling` |
| Inside Aider: help | `/help` |
| Inside Aider: exit | `exit` or `Ctrl+D` |

---

**Happy coding! 🚀**
