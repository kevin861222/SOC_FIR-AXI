## SOC_lab3
最後更新 : 2023.10.22

作者：王語

聲明：本專案接受任何理性評論與建議

---
#### Table of files 
- Code - 本專案原始程式碼
  
  *內含一個README.md說明如何運行程式*
- Simulation_logs - 模擬結果與說明
- Waveform - 波形圖
- GitHubLink.txt - 本專案連結
- LICENSE - MIT LICENSE
- RTL_Viewer(schematic).pdf - 在vivado環境下合成出來的電路圖
- fir_utilization_synth.rpt - 在pynq-z2中使用的資源統計
- report.pdf - 完整的報告
- timing_report.txt - 時序分析

---
#### Intro
設計一個FIR計算IP
- FIR
  $$Y[n] = \sum{(a[n-11]*X[n])}$$

  n ∈ [0,599]

  - data_length = 600

  - Data_Width = 32

  - Tape_Num = 11

- Hand Shake
    - AXI-Lite
    - AXI-Stream  
