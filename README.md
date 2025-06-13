# ShadowPath: Red Team Payload Delivery & Evasion Framework

## 📘 Project Overview

**ShadowPath** is a red team simulation framework that demonstrates advanced payload delivery and evasion techniques. Built and tested in a controlled lab using Kali Linux and a Windows 10 virtual environment, this project explores methods to evade Windows Defender using trusted binaries (LOLbins) like `msbuild.exe` and dynamic payloads generated through Veil and Metasploit.

The objective of this project is to replicate a real-world adversarial attack chain and learn the complexities of payload staging, execution, and detection evasion.

> ⚠️ Educational Use Only: This project is intended for ethical use in controlled environments only.

---

## 🎯 Objectives

* Simulate a complete attack lifecycle under real-time protection conditions
* Experiment with payload delivery through HTA files, shellcode, and msbuild-based loaders
* Document detection outcomes and improve payload stealth over iterations
* Gain hands-on experience with evasion tactics and red team tooling

---

## 🛠 Tools & Techniques

| Phase              | Tools / Techniques                                 |
| ------------------ | -------------------------------------------------- |
| Payload Generation | Veil, msfvenom, raw shellcode, PowerShell          |
| Delivery Vectors   | `.hta`, `msbuild.exe`, HTTP server (`python3`)     |
| Execution          | Metasploit, C# droppers, trusted LOLBins           |
| Evasion Concepts   | AMSI bypass, in-memory execution, shellcode XORing |

---

## 📁 Project Structure

```plaintext
shadowpath/
├── payloads/                 # Contains binary payloads and droppers
│   ├── shadow_payload.bin    # Raw Meterpreter shellcode
│   ├── ShadowDropper.xml     # MSBuild C# dropper
│   ├── ShadowVeil.hta        # HTA file with PowerShell reverse shell
│   └── ShadowVeil.bat        # Optional: Veil-generated .bat loader
├── scripts/
│   └── generate_shadow_payload.sh   # Script for automated payload building
├── logs/                   # Execution logs and troubleshooting notes
│   └── setup_logs.md
├── screenshots/            # Optional screenshots (e.g., Metasploit session)
├── README.md               # Project documentation
└── LICENSE                 # MIT License
```

---

## 🧪 Execution Timeline

| Day | Task                                                       |
| --- | ---------------------------------------------------------- |
| 1   | Kali + Windows 10 VM setup; networking configuration       |
| 2   | Payloads created using Veil framework                      |
| 3   | HTA-based delivery tested; blocked by Windows Defender     |
| 4   | Shifted to msbuild XML droppers for trusted binary evasion |
| 5   | Encountered AV detection of shellcode at runtime           |
| 6   | Plan to implement encryption & AMSI bypass                 |

---

## 📌 Key Learnings

* Defender inspects runtime behavior, not just file signatures
* LOLBins like `msbuild.exe` can bypass execution policies when used properly
* Shellcode obfuscation is essential for successful stealth execution
* Failures provide valuable insights into AV evasion and system internals

---

## 🚀 Future Enhancements

* XOR or AES encryption of shellcode with on-the-fly decryption
* AMSI bypass using reflection in PowerShell or C#
* Integration with C2 frameworks like Sliver or Covenant
* Add automated setup scripts and obfuscation engine
* Upload proof-of-concept video and screenshots

---

## 👤 Author & Environment

**Author**: Vicky (alias: `shadowpath-dev`)
**Host OS**: Kali Linux 2025.2 x86\_64
**Target VM**: Windows 10 Pro (Build 19045)
**Test Tools**: Metasploit, Veil, msfvenom, PowerShell, Visual C# XML

---

## 🛡 License

Licensed under the [MIT License](LICENSE).

Use strictly for ethical and educational purposes within isolated environments.
