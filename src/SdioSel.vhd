---------------------------------------------------------------------------------------------------
-- Copyright (c) 2025 by Enclustra GmbH, Switzerland.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this hardware, software, firmware, and associated documentation files (the
-- "Product"), to deal in the Product without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute,
-- sublicense, and/or sell copies of the Product, and to permit persons to whom the
-- Product is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Product.
--
-- THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
-- PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-- HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-- OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- Libraries
---------------------------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

---------------------------------------------------------------------------------------------------
-- Entity Declaration
---------------------------------------------------------------------------------------------------

entity SdioSel is
    port(
        -------------------------------------------------------------------------------------------
        -- Clock and Reset
        -------------------------------------------------------------------------------------------
        PClk        : in std_logic;
        PRstN       : in std_logic;

        -------------------------------------------------------------------------------------------
        -- APB slave inputs
        -------------------------------------------------------------------------------------------
        PEnable     : in std_logic;
        PSel        : in std_logic;
        PWrite      : in std_logic;
        PAddr       : in std_logic_vector (31 downto 0);
        PWriteData  : in std_logic_vector (31 downto 0);

        -------------------------------------------------------------------------------------------
        -- APB slave ouptputs
        -------------------------------------------------------------------------------------------
        PReady      : out std_logic;
        PSlvError   : out std_logic;
        PReadData   : out std_logic_vector (31 downto 0);

        -------------------------------------------------------------------------------------------
        -- SDIO output
        -------------------------------------------------------------------------------------------
        SdioControl : out std_logic

    );
end entity SdioSel;

---------------------------------------------------------------------------------------------------
-- Architecture Implementation
---------------------------------------------------------------------------------------------------

architecture rtl of SdioSel is

    -----------------------------------------------------------------------------------------------
    -- Constants
    -----------------------------------------------------------------------------------------------

    constant Depth_c          : positive  := 1;

    -----------------------------------------------------------------------------------------------
    -- Signals
    -----------------------------------------------------------------------------------------------

    signal RegisterVector     : std_logic_vector (Depth_c-1 downto 0);

begin

    -----------------------------------------------------------------------------------------------
    -- Clock and Reset
    -----------------------------------------------------------------------------------------------

    p_sdio_sel : process(PClk)
    begin
        if rising_edge(PClk) then
            if PRstN = '0' then
                RegisterVector <= (others => '0');
                PReadData      <= (others => '0');
                PReady         <= '0';
            elsif (not PWrite and PSel) then
                PReadData(Depth_c-1 downto 0) <= RegisterVector;
                PReady         <= '1';
            elsif (PWrite and PSel) then
                PReadData      <= (others => '0');
                RegisterVector <= PWriteData(Depth_c-1 downto 0);
                PReady         <= '1';
            else
                PReadData      <= (others => '0');
                PReady         <= '0';
            end if;
        end if;
    end process;

    -----------------------------------------------------------------------------------------------
    -- Output assignments
    -----------------------------------------------------------------------------------------------

    PSlvError <= '0';
    SdioControl <= RegisterVector(0);

end architecture rtl;

---------------------------------------------------------------------------------------------------
-- EOF
---------------------------------------------------------------------------------------------------