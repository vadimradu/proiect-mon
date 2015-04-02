--driver pentru afisajul cu sapte segmente
entity dsp_drv is
  port( clk: in std_logic;
        rst: in std_logic;
        data_in: in std_logic_vector( 15 downto 0);
        an: out std_logic_vector(3 downto 0);
        c: out std_logic_vector(7 downto 0));
end entity;
architecture Behavioral of dsp_drv is
begin
end architecture;
