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
設計一個FIR運算IP，並使用 axi 維護資料傳輸
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
  0. 透過axis_reset_n重置DUT
  1. 透過axi-lite(R)確認ap_idle = 1
  2. 傳輸length、11筆tap資訊
  3. 驗證tap資訊
  4. 傳輸ap_start資訊
  5. 準備傳輸x[n]與接收y[n]
  6. 比對golden_test
  7. 準備接收ap_done
  8. 準備接收ap_idle
  9. 比對ap_signals
  10. 重複步驟1~9兩次

#### Waveform
*僅概要說明設計，詳見 [report.pdf](https://github.com/kevin861222/SOC_lab3/blob/main/report.pdf)*

  1. FIR運算過程
     
     ![截圖 2023-10-23 上午12 07 51](https://github.com/kevin861222/SOC_lab3/assets/79128379/dcb063fd-6e4a-41d1-aaef-68715cab3281)


  2. FIR運作過程RAM Addr變化 （時間軸同上圖）
     
     ![截圖 2023-10-23 上午12 08 17](https://github.com/kevin861222/SOC_lab3/assets/79128379/5083021e-24f3-4f04-b12b-e335e708e424)


  3. AXI-Lite 讀取（AR/R Chennel）
     
     ![截圖 2023-10-23 上午12 08 57](https://github.com/kevin861222/SOC_lab3/assets/79128379/d13cbb07-bf0a-4069-abb7-665edd24421a)

  

  4. AXI-Lite 寫入 (AW/W Chennel)
     
     ![截圖 2023-10-23 上午12 09 26](https://github.com/kevin861222/SOC_lab3/assets/79128379/ac5f9321-90d6-4b38-b3be-1142a50a90b4)

     
  5. FIR狀態切換
      
     -IDLE -> WORK

     ![截圖 2023-10-23 上午12 09 51](https://github.com/kevin861222/SOC_lab3/assets/79128379/e2f80a96-40b8-4667-bc0a-07216435833d)

     -WORK -> IDLE (在ap_done被順利接收後返回初始狀態)

      ![截圖 2023-10-23 上午12 10 04](https://github.com/kevin861222/SOC_lab3/assets/79128379/a80e6b25-e697-45ef-9402-9fb27fd6d54a)



