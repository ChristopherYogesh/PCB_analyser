# PCB Diagnostics AI — Production-Ready Electronics Workstation

An intelligent, explainable engineering workstation for printed circuit board inspection, fault isolation, optical defect analysis, and root-cause diagnostics.

---

## 1. Key Capabilities

* **Interactive 2D CAD PCB Viewer**: High-precision SVG/Canvas viewer featuring zoom, pan, pin tooltips, live test probe markers, and thermal anomaly overlays.
* **3D Parametric PCB Visualizer**: Three.js WebGL model with realistic component heights, metallic textures, and interactive orbit controls.
* **Dynamic Board Profile Engine**: Decoupled hardware profiles defined via clean JSON schemas (`profile.json`, `pinout.json`, `components.json`, `rules.json`). Initial implementation includes full **ESP32-WROOM-32 DevKit V1** support.
* **Computer Vision Pipeline**: OpenCV baseline evaluating sharpness (Laplacian variance), PCB substrate segmentation, component bounding boxes, and thermal discoloration / burn mark analysis.
* **Hybrid AI Diagnostic Engine**: Multi-source evidence scoring combining deterministic board rules, bench measurements, optical anomalies, datasheet documentation, and AI reasoning.
* **Hardware Measurement Telemetry**: Manual multimeter logging plus a virtual automated test bench simulator (`VirtualHardwareBenchProvider`).
* **Document Ingestion Hub**: Multi-page PDF datasheet text extraction with SHA-256 cryptographic verification and keyword search indexing.
* **Engineering PDF Reports**: High-quality downloadable ReportLab diagnostic documents complete with executive summaries, fault explanations, and disclaimers.
* **Enterprise Security**: Scrypt password hashing, JWT authorization, role-based access control (`ADMIN`, `ENGINEER`, `TECHNICIAN`, `VIEWER`), and secure upload sanitization.

---

## 2. Technology Stack

### Backend
* **Python 3.11** in dedicated virtual environment (`venv`)
* **Flask** modular Blueprint architecture
* **SQLAlchemy ORM** (SQLite default, PostgreSQL production-ready)
* **ReportLab** for PDF report generation
* **PyPDF** for datasheet text extraction
* **OpenCV & Pillow** for optical surface inspection
* **Pytest** automated test suite

### Frontend
* **React 18** with **Vite** & **TypeScript**
* **Tailwind CSS** with custom dark engineering CAD theme
* **Three.js** for 3D parametric board visualization
* **Lucide React** icons & **React Router**
* **Axios** client with Bearer token authentication

---

## 3. Quick Start (Local Run)

### Prerequisites
* Python 3.11+
* Node.js v20+ & npm

### One-Click Launch (Windows)
Double-click:
```bat
run_all.bat
```
This automatically starts both the Flask backend on `http://127.0.0.1:5000` and the Vite frontend on `http://localhost:5173`.

### Manual Startup

#### 1. Backend
```bash
# Activate virtual environment
venv\Scripts\activate.bat   # On Windows
# source venv/bin/activate  # On Linux/macOS

# Seed database and start server
python backend/run.py --seed
```
Backend will be active at: `http://127.0.0.1:5000`

#### 2. Frontend
```bash
cd frontend
npm install
npm run dev
```
Frontend workstation will be active at: `http://localhost:5173`

---

## 4. Default Demonstration Credentials

| Role | Email | Password | Access Level |
| :--- | :--- | :--- | :--- |
| **Lead Diagnostic Engineer** | `engineer@pcbdiag.ai` | `Engineer@123` | Full Workstation & Measurements |
| **Chief Lab Architect** | `admin@pcbdiag.ai` | `Admin@123` | Full Administration & Profiles |

*(The login page also provides one-click "Demo Engineer" and "Demo Admin" autofill buttons).*

---

## 5. End-to-End Diagnostic Workflow

1. **Sign In**: Log in using `engineer@pcbdiag.ai`.
2. **Open Workstation**: Select the pre-seeded session: *"ESP32 Cyclic Brownout Reset & Overheating Regulator"*.
3. **Inspect 2D/3D PCB**:
   * Pan and zoom into the board.
   * Click on component **U3** (AMS1117-3.3 Linear Regulator).
   * Notice the thermal discoloration halo detected by the optical pipeline.
   * Switch between **2D CAD** and **3D Model** tabs.
4. **Review AI Root Cause**:
   * Inspect the primary finding: *"AMS1117-3.3 Linear Voltage Regulator Thermal Dropout"*.
   * Read the explainable "Why", multi-source evidence points, and recommended actions.
5. **Log Test Bench Measurements**:
   * Click **"Auto-Test Fixture Sim"** or **"Add Measurement"** to record live voltage and current readings.
   * Observe the 3.3V rail flagged as `CRITICAL` at `2.71V`.
6. **Re-Analyze & Finalize**:
   * Click **"Re-Analyze"** to observe real-time confidence updates.
   * Click **"Finalize"** to record engineer sign-off notes.
7. **Export PDF Report**:
   * Click **"Export PDF"** to download the official diagnostic engineering document.

---

## 6. Running Automated Tests

Run the complete backend test suite:
```bash
venv\Scripts\pytest.exe backend/tests/ -v
```

Build the frontend production bundle:
```bash
cd frontend
npm run build
```

---

## 7. Adding New Board Profiles

To add support for a new board (e.g. `stm32_bluepill` or `arduino_uno`):
1. Create a directory: `board_profiles/<new_board_id>/`.
2. Add the four specification files:
   * `profile.json`: General board metadata and power domains.
   * `pinout.json`: Header pins and expected voltages.
   * `components.json`: Relative coordinates and packages.
   * `rules.json`: Circuit diagnostic rules and trigger signatures.
3. Click **"Resync Filesystem"** on the Board Profiles page or call `POST /api/boards/sync`.
The platform will immediately integrate the board without modifying any backend code.

---

## 8. License & Notice
Designed for high-reliability electronics inspection, embedded systems development, and academic evaluation.
AI-assisted outputs support engineering troubleshooting and do not replace certified safety procedures.
