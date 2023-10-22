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

#### FIR 運作機制
  0. 初始狀態為IDEL，指允許AXI-Lite傳輸。
  1. 接收11筆tap，同時在內部reset data RAM
  2. 接收length
  3. 接收ap_start，進入WORK狀態，允許AXI_Lite與AXI-Stream傳輸
  4. 接收x[n]並運算，再將y[n]輸出，接收資料、運算、傳出資料是平行任務
     當counter=length時輸出y[n]會附帶tlast信號
  5. 結束運算ap_done = 1，等待該資訊傳遞成功
  6. ap_done 復位，發self_reset_n，將系統回復初始狀態，此self_reset_n不會重置data RAM以及tap RAM中的資料。
 
#### TestBench 驗證概述

#### Waveform
*詳見report.pdf*
