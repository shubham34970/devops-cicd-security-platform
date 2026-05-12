#!/bin/bash

# Simulated SonarQube Scanner Script

echo "INFO: Scanner configuration file: $(pwd)/sonar-project.properties"
echo "INFO: Project root configuration file: NONE"
echo "INFO: SonarScanner 4.8.0.2856"
echo "INFO: Java 17.0.6 Eclipse Adoptium (64-bit)"
echo "INFO: Linux 5.15.0-1033-azure amd64"

# Create reports directory
REPORT_DIR="reports/sonarqube"
mkdir -p "$REPORT_DIR"

echo "INFO: Analyzing source code..."
sleep 1
echo "INFO: Found 12 source files to be analyzed."
echo "INFO: Scanning YAML files..."
echo "INFO: Scanning Shell scripts..."
echo "INFO: Scanning Application source code (.js)..."
sleep 1

# Generate mock reports
echo "INFO: Generating reports..."

# 1. Bugs Report
cat <<EOF > "$REPORT_DIR/bugs-report.json"
{
  "total": 0,
  "issues": []
}
EOF

# 2. Vulnerabilities Report
cat <<EOF > "$REPORT_DIR/vulnerabilities-report.json"
{
  "total": 0,
  "issues": []
}
EOF

# 3. Code Smells Report
cat <<EOF > "$REPORT_DIR/code-smells-report.json"
{
  "total": 3,
  "issues": [
    {"rule": "javascript:S1117", "message": "Remove this unused local variable."},
    {"rule": "javascript:S1128", "message": "Remove this unused import."},
    {"rule": "javascript:S1481", "message": "Unused local variables should be removed."}
  ]
}
EOF

# 4. Duplicated Code Report
cat <<EOF > "$REPORT_DIR/duplicated-code-report.json"
{
  "totalLines": 500,
  "duplicatedLines": 0,
  "duplicationDensity": 0.0
}
EOF

echo "INFO: Reports saved inside $REPORT_DIR/"

echo "INFO: EXECUTION SUCCESS"
echo "INFO: ------------------------------------------------------------------------"

# Simulate Quality Gate Validation
echo "INFO: Checking Quality Gate status..."
sleep 1

if [ "$FAIL_QUALITY_GATE" = "true" ]; then
    echo "ERROR: Quality Gate failed!"
    echo "ERROR: Bugs threshold exceeded."
    echo "### SonarQube Quality Gate Status" >> $GITHUB_STEP_SUMMARY
    echo "Status: **FAILED** :x:" >> $GITHUB_STEP_SUMMARY
    exit 1
else
    echo "INFO: Quality Gate passed!"
    echo "### SonarQube Quality Gate Status" >> $GITHUB_STEP_SUMMARY
    echo "Status: **PASSED** :white_check_mark:" >> $GITHUB_STEP_SUMMARY
    exit 0
fi
