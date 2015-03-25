-- implementarea curenta este ajustata pentru 800x600@72
-- intrarea de ceas trebuie sa functioneze la 50Mhz

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY vga_controller IS
  GENERIC(
    h_pulse  :  INTEGER   := 120;   --horiztonal sync pulse width in pixels
    h_bp     :  INTEGER   := 64;   --horiztonal back porch width in pixels
    h_pixels :  INTEGER   := 800;  --horiztonal display width in pixels
    h_fp     :  INTEGER   := 56;   --horiztonal front porch width in pixels
    h_pol    :  STD_LOGIC := '1';   --horizontal sync pulse polarity (1 = positive, 0 = negative)
    v_pulse  :  INTEGER   := 3;     --vertical sync pulse width in rows
    v_bp     :  INTEGER   := 23;    --vertical back porch width in rows
    v_pixels :  INTEGER   := 600;  --vertical display width in rows
    v_fp     :  INTEGER   := 37;     --vertical front porch width in rows
    v_pol    :  STD_LOGIC := '1');  --vertical sync pulse polarity (1 = positive, 0 = negative)
  PORT(
    pixel_clk :  IN   STD_LOGIC;  --pixel clock at frequency of VGA mode being used
    reset_n   :  IN   STD_LOGIC;  --active low asycnchronous reset
    h_sync    :  OUT  STD_LOGIC;  --horiztonal sync pulse
    v_sync    :  OUT  STD_LOGIC;  --vertical sync pulse
    disp_ena  :  OUT  STD_LOGIC;  --display enable ('1' = display time, '0' = blanking time)
    column    :  OUT  INTEGER;    --horizontal pixel coordinate
    row       :  OUT  INTEGER);    --vertical pixel coordinate
    --n_blank   :  OUT  STD_LOGIC;  --direct blacking output to DAC
    --n_sync    :  OUT  STD_LOGIC); --sync-on-green output to DAC
END vga_controller;

