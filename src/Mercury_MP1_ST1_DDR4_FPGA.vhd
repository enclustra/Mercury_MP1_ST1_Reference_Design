----------------------------------------------------------------------------------------------------
-- Copyright (c) 2022 by Enclustra GmbH, Switzerland.
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
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- libraries
----------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------------------------------------------------------------------
-- entity declaration
----------------------------------------------------------------------------------------------------
entity Mercury_MP1_ST1_DDR4_FPGA is
  
  port (
    -- MSS Pins
    MSS_REFCLK_N                   : in     std_logic;
    MSS_REFCLK_P                   : in     std_logic;
    MSS_SGMII_RX0_N                : in     std_logic;
    MSS_SGMII_RX0_P                : in     std_logic;
    MSS_SGMII_RX1_N                : in     std_logic;
    MSS_SGMII_RX1_P                : in     std_logic;
    SD_CD_N_EMMC_STRB              : in     std_logic;
    USB_CLK                        : in     std_logic;
    USB_DIR                        : in     std_logic;
    USB_NXT                        : in     std_logic;
    DDR4MSS_A                      : out    std_logic_vector(13 downto 0);
    DDR4MSS_ACT_N                  : out    std_logic;
    DDR4MSS_BA                     : out    std_logic_vector(1 downto 0);
    DDR4MSS_BG0                    : out    std_logic;
    DDR4MSS_CAS_N                  : out    std_logic;
    DDR4MSS_CKE                    : out    std_logic;
    DDR4MSS_CK_N                   : out    std_logic;
    DDR4MSS_CK_P                   : out    std_logic;
    DDR4MSS_CS_N                   : out    std_logic;
    DDR4MSS_ODT                    : out    std_logic;
    DDR4MSS_RAS_N                  : out    std_logic;
    DDR4MSS_RESET_N                : out    std_logic;
    DDR4MSS_WE_N                   : out    std_logic;
    ETH_MDC                        : out    std_logic;
    MSSIO7_EMMC_RST_N              : out    std_logic;
    MSS_LED0_N                     : out    std_logic;
    MSS_LED1_N                     : out    std_logic;
    MSS_RST_N                      : out    std_logic;
    MSS_SGMII_TX0_N                : out    std_logic;
    MSS_SGMII_TX0_P                : out    std_logic;
    MSS_SGMII_TX1_N                : out    std_logic;
    MSS_SGMII_TX1_P                : out    std_logic;
    QSPI_CLK                       : out    std_logic;
    QSPI_SS0                       : out    std_logic;
    SD_CLK_EMMC_CLK                : out    std_logic;
    USB_STP                        : out    std_logic;
    DDR4MSS_DQ                     : inout  std_logic_vector(35 downto 0);
    DDR4MSS_DQS_N                  : inout  std_logic_vector(4 downto 0);
    DDR4MSS_DQS_P                  : inout  std_logic_vector(4 downto 0);
    ETH_MDIO                       : inout  std_logic;
    I2C_INT_N_MSS                  : inout  std_logic;
    I2C_MSS_SCL                    : inout  std_logic;
    I2C_MSS_SDA                    : inout  std_logic;
    MSSIO10_EMMC_IO6               : inout  std_logic;
    MSSIO11_EMMC_IO7               : inout  std_logic;
    MSSIO8_EMMC_IO4                : inout  std_logic;
    QSPI_DATA0                     : inout  std_logic;
    QSPI_DATA1                     : inout  std_logic;
    QSPI_DATA2                     : inout  std_logic;
    QSPI_DATA3                     : inout  std_logic;
    SD_CMD_EMMC_CMD                : inout  std_logic;
    SD_DATA0_EMMC_DATA0            : inout  std_logic;
    SD_DATA1_EMMC_DATA1            : inout  std_logic;
    SD_DATA2_EMMC_DATA2            : inout  std_logic;
    SD_DATA3_EMMC_DATA3            : inout  std_logic;
    SD_VSEL_EMMC_IO5               : inout  std_logic;
    USB_DATA0                      : inout  std_logic;
    USB_DATA1                      : inout  std_logic;
    USB_DATA2                      : inout  std_logic;
    USB_DATA3                      : inout  std_logic;
    USB_DATA4                      : inout  std_logic;
    USB_DATA5                      : inout  std_logic;
    USB_DATA6                      : inout  std_logic;
    USB_DATA7                      : inout  std_logic;
    
    -- Anios 0
    IO0_D0_P                       : inout   std_logic;
    IO0_D1_N                       : inout   std_logic;
    IO0_D2_P                       : inout   std_logic;
    IO0_D3_N                       : inout   std_logic;
    IO0_D4_P                       : inout   std_logic;
    IO0_D5_N                       : inout   std_logic;
    IO0_D6_P                       : inout   std_logic;
    IO0_D7_N                       : inout   std_logic;
    IO0_D8_P                       : inout   std_logic;
    IO0_D9_N                       : inout   std_logic;
    IO0_D10_P                      : inout   std_logic;
    IO0_D11_N                      : inout   std_logic;
    IO0_D12_P                      : inout   std_logic;
    IO0_D13_N                      : inout   std_logic;
    IO0_D14_P                      : inout   std_logic;
    IO0_D15_N                      : inout   std_logic;
    IO0_D16_P                      : inout   std_logic;
    IO0_D17_N                      : inout   std_logic;
    IO0_D18_P                      : inout   std_logic;
    IO0_D19_N                      : inout   std_logic;
    IO0_D20_P                      : inout   std_logic;
    IO0_D21_N                      : inout   std_logic;
    IO0_D22_P                      : inout   std_logic;
    IO0_D23_N                      : inout   std_logic;
    IO0_CLK_N                      : inout   std_logic;
    IO0_CLK_P                      : inout   std_logic;
    
    -- Anios 1
    IO1_D0_P                       : inout   std_logic;
    IO1_D1_N                       : inout   std_logic;
    IO1_D2_P                       : inout   std_logic;
    IO1_D3_N                       : inout   std_logic;
    IO1_D4_P                       : inout   std_logic;
    IO1_D5_N                       : inout   std_logic;
    IO1_D6_P                       : inout   std_logic;
    IO1_D7_N                       : inout   std_logic;
    IO1_D8_P                       : inout   std_logic;
    IO1_D9_N                       : inout   std_logic;
    IO1_D10_P                      : inout   std_logic;
    IO1_D11_N                      : inout   std_logic;
    IO1_D12_P                      : inout   std_logic;
    IO1_D13_N                      : inout   std_logic;
    IO1_D14_P                      : inout   std_logic;
    IO1_D15_N                      : inout   std_logic;
    IO1_D16_P                      : inout   std_logic;
    IO1_D17_N                      : inout   std_logic;
    IO1_D18_P                      : inout   std_logic;
    IO1_D19_N                      : inout   std_logic;
    IO1_D20_P                      : inout   std_logic;
    IO1_D21_N                      : inout   std_logic;
    IO1_D22_P                      : inout   std_logic;
    IO1_D23_N                      : inout   std_logic;
    IO1_CLK1_N                     : inout   std_logic;
    IO1_CLK0_P                     : inout   std_logic;
    
    -- BUTTONS
    BTN1_N                         : in      std_logic;
    
    -- Clock Generator CLK0
    CLK_USR_N                      : in      std_logic;
    CLK_USR_P                      : in      std_logic;
    
    -- 50 MHz clock
    CLK50                          : in      std_logic;
    
    -- FMC HPC Connector
    FMC_HA02_N                     : inout   std_logic;
    FMC_HA02_P                     : inout   std_logic;
    FMC_HA03_N                     : inout   std_logic;
    FMC_HA03_P                     : inout   std_logic;
    FMC_HA04_N                     : inout   std_logic;
    FMC_HA04_P                     : inout   std_logic;
    FMC_HA05_N                     : inout   std_logic;
    FMC_HA05_P                     : inout   std_logic;
    FMC_HA06_N                     : inout   std_logic;
    FMC_HA06_P                     : inout   std_logic;
    FMC_HA07_N                     : inout   std_logic;
    FMC_HA07_P                     : inout   std_logic;
    FMC_HA08_N                     : inout   std_logic;
    FMC_HA08_P                     : inout   std_logic;
    FMC_HA09_N                     : inout   std_logic;
    FMC_HA09_P                     : inout   std_logic;
    FMC_HA10_N                     : inout   std_logic;
    FMC_HA10_P                     : inout   std_logic;
    FMC_HA11_N                     : inout   std_logic;
    FMC_HA11_P                     : inout   std_logic;
    FMC_HA12_N                     : inout   std_logic;
    FMC_HA12_P                     : inout   std_logic;
    FMC_HA13_N                     : inout   std_logic;
    FMC_HA13_P                     : inout   std_logic;
    FMC_LA02_N                     : inout   std_logic;
    FMC_LA02_P                     : inout   std_logic;
    FMC_LA03_N                     : inout   std_logic;
    FMC_LA03_P                     : inout   std_logic;
    FMC_LA04_N                     : inout   std_logic;
    FMC_LA04_P                     : inout   std_logic;
    FMC_LA05_N                     : inout   std_logic;
    FMC_LA05_P                     : inout   std_logic;
    FMC_LA06_N                     : inout   std_logic;
    FMC_LA06_P                     : inout   std_logic;
    FMC_LA07_N                     : inout   std_logic;
    FMC_LA07_P                     : inout   std_logic;
    FMC_LA08_N                     : inout   std_logic;
    FMC_LA08_P                     : inout   std_logic;
    FMC_LA09_N                     : inout   std_logic;
    FMC_LA09_P                     : inout   std_logic;
    FMC_LA10_N                     : inout   std_logic;
    FMC_LA10_P                     : inout   std_logic;
    FMC_LA11_N                     : inout   std_logic;
    FMC_LA11_P                     : inout   std_logic;
    FMC_LA12_N                     : inout   std_logic;
    FMC_LA12_P                     : inout   std_logic;
    FMC_LA13_N                     : inout   std_logic;
    FMC_LA13_P                     : inout   std_logic;
    FMC_LA14_N                     : inout   std_logic;
    FMC_LA14_P                     : inout   std_logic;
    FMC_LA15_N                     : inout   std_logic;
    FMC_LA15_P                     : inout   std_logic;
    FMC_LA16_N                     : inout   std_logic;
    FMC_LA16_P                     : inout   std_logic;
    FMC_LA19_N                     : inout   std_logic;
    FMC_LA19_P                     : inout   std_logic;
    FMC_LA20_N                     : inout   std_logic;
    FMC_LA20_P                     : inout   std_logic;
    FMC_LA21_N                     : inout   std_logic;
    FMC_LA21_P                     : inout   std_logic;
    FMC_LA22_N                     : inout   std_logic;
    FMC_LA22_P                     : inout   std_logic;
    FMC_LA23_N                     : inout   std_logic;
    FMC_LA23_P                     : inout   std_logic;
    FMC_LA24_N                     : inout   std_logic;
    FMC_LA24_P                     : inout   std_logic;
    FMC_LA25_N                     : inout   std_logic;
    FMC_LA25_P                     : inout   std_logic;
    FMC_LA26_N                     : inout   std_logic;
    FMC_LA26_P                     : inout   std_logic;
    FMC_LA27_N                     : inout   std_logic;
    FMC_LA27_P                     : inout   std_logic;
    FMC_LA28_N                     : inout   std_logic;
    FMC_LA28_P                     : inout   std_logic;
    FMC_LA29_N                     : inout   std_logic;
    FMC_LA29_P                     : inout   std_logic;
    FMC_LA30_N                     : inout   std_logic;
    FMC_LA30_P                     : inout   std_logic;
    FMC_LA31_N                     : inout   std_logic;
    FMC_LA31_P                     : inout   std_logic;
    FMC_LA32_N                     : inout   std_logic;
    FMC_LA32_P                     : inout   std_logic;
    FMC_LA33_N                     : inout   std_logic;
    FMC_LA33_P                     : inout   std_logic;
    FMC_HA00_CC_N                  : inout   std_logic;
    FMC_HA00_CC_P                  : inout   std_logic;
    FMC_HA01_CC_N                  : inout   std_logic;
    FMC_HA01_CC_P                  : inout   std_logic;
    FMC_HA17_N                     : inout   std_logic;
    FMC_HA17_P                     : inout   std_logic;
    FMC_LA00_CC_N                  : inout   std_logic;
    FMC_LA00_CC_P                  : inout   std_logic;
    FMC_LA01_CC_N                  : inout   std_logic;
    FMC_LA01_CC_P                  : inout   std_logic;
    FMC_LA17_CC_N                  : inout   std_logic;
    FMC_LA17_CC_P                  : inout   std_logic;
    FMC_LA18_CC_N                  : inout   std_logic;
    FMC_LA18_CC_P                  : inout   std_logic;
    FMC_CLK0_M2C_N                 : inout   std_logic;
    FMC_CLK0_M2C_P                 : inout   std_logic;
    FMC_CLK1_M2C_N                 : inout   std_logic;
    FMC_CLK1_M2C_P                 : inout   std_logic;
    -- PL DDR4 Memory
    DDR4FPGA_PAR                   : out     std_logic;
    DDR4FPGA_WE_N                  : out     std_logic;
    DDR4FPGA_ACT_N                 : out     std_logic;
    DDR4FPGA_CAS_N                 : out     std_logic;
    DDR4FPGA_RAS_N                 : out     std_logic;
    DDR4FPGA_ALERT_N               : in      std_logic;
    DDR4FPGA_RESET_N               : out     std_logic;
    SHIELD0                        : out     std_logic;
    SHIELD1                        : out     std_logic;
    SHIELD2                        : out     std_logic;
    SHIELD3                        : out     std_logic;
    SHIELD4                        : out     std_logic;
    SHIELD5                        : out     std_logic;
    SHIELD6                        : out     std_logic;
    SHIELD7                        : out     std_logic;
    DDR4FPGA_BA                    : out     std_logic_vector(1 downto 0);
    DDR4FPGA_BG                    : out     std_logic_vector(0 downto 0);
    DDR4FPGA_CKE                   : out     std_logic_vector(0 downto 0);
    DDR4FPGA_DQ                    : inout   std_logic_vector(63 downto 0);
    DDR4FPGA_ODT                   : out     std_logic_vector(0 downto 0);
    DDR4FPGA_A                     : out     std_logic_vector(13 downto 0);
    DDR4FPGA_CK_N                  : out     std_logic_vector(0 downto 0);
    DDR4FPGA_CK_P                  : out     std_logic_vector(0 downto 0);
    DDR4FPGA_CS_N                  : out     std_logic_vector(0 downto 0);
    DDR4FPGA_DM                    : inout   std_logic_vector(7 downto 0);
    DDR4FPGA_DQS_P                 : inout   std_logic_vector(7 downto 0);
    DDR4FPGA_DQS_N                 : inout   std_logic_vector(7 downto 0);
    
    -- Gigabit Ethernet 0 GPIOs
    ETH0_GPIO0                     : inout   std_logic;
    ETH0_GPIO1                     : inout   std_logic;
    
    -- Gigabit Ethernet 1 GPIOs
    ETH1_GPIO0                     : inout   std_logic;
    ETH1_GPIO1                     : inout   std_logic;
    
    -- HDMI
    HDMI_HPD                       : in      std_logic;
    HDMI_CLK_N                     : out     std_logic;
    HDMI_CLK_P                     : out     std_logic;
    
    -- I2C FPGA
    I2C_SCL_FPGA                   : inout   std_logic;
    I2C_SDA_FPGA                   : inout   std_logic;
    
    -- I2C_MIPI_SEL
    I2C_MIPI_SEL                   : inout   std_logic;
    
    -- PL I2C
    I2C_INT_N                      : in      std_logic;
    I2C_SCL                        : inout   std_logic;
    I2C_SDA                        : inout   std_logic;
    
    -- IO3
    IO3_D0_P                       : inout   std_logic;
    IO3_D1_N                       : inout   std_logic;
    IO3_D2_P                       : inout   std_logic;
    IO3_D3_N                       : inout   std_logic;
    IO3_D4_P                       : inout   std_logic;
    IO3_D5_N                       : inout   std_logic;
    IO3_D6_P                       : inout   std_logic;
    IO3_D7_N                       : inout   std_logic;
    
    -- IO4
    IO4_D0_P                       : inout   std_logic;
    IO4_D1_N                       : inout   std_logic;
    IO4_D2_P                       : inout   std_logic;
    IO4_D3_N                       : inout   std_logic;
    IO4_D4_P                       : inout   std_logic;
    IO4_D5_N                       : inout   std_logic;
    IO4_D6_P                       : inout   std_logic;
    IO4_D7_N                       : inout   std_logic;
    
    -- LED
    FPGA_LED0_N                    : out     std_logic;
    FPGA_LED1_N                    : out     std_logic;
    FPGA_LED2_N                    : out     std_logic;
    FPGA_LED3_N                    : out     std_logic;
    
    -- MIPI0
    MIPI0_D0_N                     : inout   std_logic;
    MIPI0_D0_P                     : inout   std_logic;
    MIPI0_D1_N                     : inout   std_logic;
    MIPI0_D1_P                     : inout   std_logic;
    MIPI0_CLK_D0LP_N               : inout   std_logic;
    MIPI0_CLK_D0LP_P               : inout   std_logic;
    MIPI0_CLK_N                    : inout   std_logic;
    MIPI0_CLK_P                    : inout   std_logic;
    
    -- MIPI1
    MIPI1_D0_N                     : inout   std_logic;
    MIPI1_D0_P                     : inout   std_logic;
    MIPI1_D1_N                     : inout   std_logic;
    MIPI1_D1_P                     : inout   std_logic;
    MIPI1_CLK_D0LP_N               : inout   std_logic;
    MIPI1_CLK_D0LP_P               : inout   std_logic;
    MIPI1_CLK_N                    : inout   std_logic;
    MIPI1_CLK_P                    : inout   std_logic;
    
    -- MISC
    VBUS_DETECT                    : inout   std_logic;
    BOOT_MODE1                     : inout   std_logic;
    SRST_N_RDY_N                   : inout   std_logic;
    BOOT_MODE0                     : inout   std_logic;
    
    -- Oscillator 100 MHz
    CLK_100_CAL                    : in      std_logic;
    
    -- SDIO_SEL
    SDIO_SEL                       : out     std_logic;
    
    -- ST1 LED
    LED2                           : out     std_logic;
    LED3                           : out     std_logic;
    
    -- TPM
    TPM_SPI_CLK                    : out     std_logic;
    TPM_SPI_CS_N                   : out     std_logic;
    TPM_GPIO                       : inout   std_logic;
    TPM_SPI_MISO                   : in      std_logic;
    TPM_SPI_MOSI                   : out     std_logic;
    TPM_RST_N                      : out     std_logic;
    TPM_PIRQ_N                     : inout   std_logic;
    
    -- UART
    UART_RX                        : in      std_logic;
    UART_TX                        : out     std_logic
  );
end Mercury_MP1_ST1_DDR4_FPGA;

architecture rtl of Mercury_MP1_ST1_DDR4_FPGA is

  ----------------------------------------------------------------------------------------------------
  -- component declarations
  ----------------------------------------------------------------------------------------------------
  component Mercury_MP1 is
    port (
      CLK50               : in     std_logic;
      MSS_REFCLK_N        : in     std_logic;
      MSS_REFCLK_P        : in     std_logic;
      MSS_SGMII_RX0_N     : in     std_logic;
      MSS_SGMII_RX0_P     : in     std_logic;
      MSS_SGMII_RX1_N     : in     std_logic;
      MSS_SGMII_RX1_P     : in     std_logic;
      SD_CD_N_EMMC_STRB   : in     std_logic;
      USB_CLK             : in     std_logic;
      USB_DIR             : in     std_logic;
      USB_NXT             : in     std_logic;
      DDR4MSS_A           : out    std_logic_vector(13 downto 0);
      DDR4MSS_ACT_N       : out    std_logic;
      DDR4MSS_BA          : out    std_logic_vector(1 downto 0);
      DDR4MSS_BG0         : out    std_logic;
      DDR4MSS_CAS_N       : out    std_logic;
      DDR4MSS_CKE         : out    std_logic;
      DDR4MSS_CK_N        : out    std_logic;
      DDR4MSS_CK_P        : out    std_logic;
      DDR4MSS_CS_N        : out    std_logic;
      DDR4MSS_ODT         : out    std_logic;
      DDR4MSS_RAS_N       : out    std_logic;
      DDR4MSS_RESET_N     : out    std_logic;
      DDR4MSS_WE_N        : out    std_logic;
      ETH_MDC             : out    std_logic;
      MSSIO7_EMMC_RST_N   : out    std_logic;
      MSS_LED0_N          : out    std_logic;
      MSS_LED1_N          : out    std_logic;
      MSS_RST_N           : out    std_logic;
      MSS_SGMII_TX0_N     : out    std_logic;
      MSS_SGMII_TX0_P     : out    std_logic;
      MSS_SGMII_TX1_N     : out    std_logic;
      MSS_SGMII_TX1_P     : out    std_logic;
      QSPI_CLK            : out    std_logic;
      QSPI_SS0            : out    std_logic;
      SD_CLK_EMMC_CLK     : out    std_logic;
      USB_STP             : out    std_logic;
      DDR4MSS_DQ          : inout  std_logic_vector(35 downto 0);
      DDR4MSS_DQS_N       : inout  std_logic_vector(4 downto 0);
      DDR4MSS_DQS_P       : inout  std_logic_vector(4 downto 0);
      ETH_MDIO            : inout  std_logic;
      I2C_INT_N_MSS       : inout  std_logic;
      I2C_MSS_SCL         : inout  std_logic;
      I2C_MSS_SDA         : inout  std_logic;
      MSSIO10_EMMC_IO6    : inout  std_logic;
      MSSIO11_EMMC_IO7    : inout  std_logic;
      MSSIO8_EMMC_IO4     : inout  std_logic;
      QSPI_DATA0          : inout  std_logic;
      QSPI_DATA1          : inout  std_logic;
      QSPI_DATA2          : inout  std_logic;
      QSPI_DATA3          : inout  std_logic;
      SD_CMD_EMMC_CMD     : inout  std_logic;
      SD_DATA0_EMMC_DATA0 : inout  std_logic;
      SD_DATA1_EMMC_DATA1 : inout  std_logic;
      SD_DATA2_EMMC_DATA2 : inout  std_logic;
      SD_DATA3_EMMC_DATA3 : inout  std_logic;
      SD_VSEL_EMMC_IO5    : inout  std_logic;
      USB_DATA0           : inout  std_logic;
      USB_DATA1           : inout  std_logic;
      USB_DATA2           : inout  std_logic;
      USB_DATA3           : inout  std_logic;
      USB_DATA4           : inout  std_logic;
      USB_DATA5           : inout  std_logic;
      USB_DATA6           : inout  std_logic;
      USB_DATA7           : inout  std_logic;
      DDR4FPGA_PAR        : out    std_logic;
      DDR4FPGA_WE_N       : out    std_logic;
      DDR4FPGA_ACT_N      : out    std_logic;
      DDR4FPGA_CAS_N      : out    std_logic;
      DDR4FPGA_RAS_N      : out    std_logic;
      DDR4FPGA_ALERT_N    : in     std_logic;
      DDR4FPGA_RESET_N    : out    std_logic;
      SHIELD0             : out    std_logic;
      SHIELD1             : out    std_logic;
      SHIELD2             : out    std_logic;
      SHIELD3             : out    std_logic;
      SHIELD4             : out    std_logic;
      SHIELD5             : out    std_logic;
      SHIELD6             : out    std_logic;
      SHIELD7             : out    std_logic;
      DDR4FPGA_BA         : out    std_logic_vector(1 downto 0);
      DDR4FPGA_BG         : out    std_logic_vector(0 downto 0);
      DDR4FPGA_CKE        : out    std_logic_vector(0 downto 0);
      DDR4FPGA_DQ         : inout  std_logic_vector(63 downto 0);
      DDR4FPGA_ODT        : out    std_logic_vector(0 downto 0);
      DDR4FPGA_A          : out    std_logic_vector(13 downto 0);
      DDR4FPGA_CK_N       : out    std_logic_vector(0 downto 0);
      DDR4FPGA_CK_P       : out    std_logic_vector(0 downto 0);
      DDR4FPGA_CS_N       : out    std_logic_vector(0 downto 0);
      DDR4FPGA_DM         : inout  std_logic_vector(7 downto 0);
      DDR4FPGA_DQS_P      : inout  std_logic_vector(7 downto 0);
      DDR4FPGA_DQS_N      : inout  std_logic_vector(7 downto 0);
      I2C_SCL_FPGA        : inout  std_logic;
      I2C_SDA_FPGA        : inout  std_logic;
      I2C_SCL             : inout  std_logic;
      I2C_SDA             : inout  std_logic;
      FPGA_LED0_N         : out    std_logic;
      FPGA_LED1_N         : out    std_logic;
      FPGA_LED2_N         : out    std_logic;
      FPGA_LED3_N         : out    std_logic;
      SDIO_SEL            : out    std_logic;
      TPM_SPI_CLK         : out    std_logic;
      TPM_SPI_MISO        : in     std_logic;
      TPM_SPI_MOSI        : out    std_logic;
      TPM_SPI_CS_N        : out    std_logic;
      UART_RX             : in     std_logic;
      UART_TX             : out    std_logic;
      UART_SEL            : out    std_logic
    );
    
  end component Mercury_MP1;

  ----------------------------------------------------------------------------------------------------
  -- signal declarations
  ----------------------------------------------------------------------------------------------------
  signal UART_SEL         : std_logic := '0';
  signal LedCount         : unsigned(23 downto 0);

begin
  
  ----------------------------------------------------------------------------------------------------
  -- processor system instance
  ----------------------------------------------------------------------------------------------------
  Mercury_MP1_i: component Mercury_MP1
    port map (
      CLK50                => CLK50,
      MSS_REFCLK_N         => MSS_REFCLK_N,
      MSS_REFCLK_P         => MSS_REFCLK_P,
      MSS_SGMII_RX0_N      => MSS_SGMII_RX0_N,
      MSS_SGMII_RX0_P      => MSS_SGMII_RX0_P,
      MSS_SGMII_RX1_N      => MSS_SGMII_RX1_N,
      MSS_SGMII_RX1_P      => MSS_SGMII_RX1_P,
      SD_CD_N_EMMC_STRB    => SD_CD_N_EMMC_STRB,
      USB_CLK              => USB_CLK,
      USB_DIR              => USB_DIR,
      USB_NXT              => USB_NXT,
      DDR4MSS_A            => DDR4MSS_A,
      DDR4MSS_ACT_N        => DDR4MSS_ACT_N,
      DDR4MSS_BA           => DDR4MSS_BA,
      DDR4MSS_BG0          => DDR4MSS_BG0,
      DDR4MSS_CAS_N        => DDR4MSS_CAS_N,
      DDR4MSS_CKE          => DDR4MSS_CKE,
      DDR4MSS_CK_N         => DDR4MSS_CK_N,
      DDR4MSS_CK_P         => DDR4MSS_CK_P,
      DDR4MSS_CS_N         => DDR4MSS_CS_N,
      DDR4MSS_ODT          => DDR4MSS_ODT,
      DDR4MSS_RAS_N        => DDR4MSS_RAS_N,
      DDR4MSS_RESET_N      => DDR4MSS_RESET_N,
      DDR4MSS_WE_N         => DDR4MSS_WE_N,
      ETH_MDC              => ETH_MDC,
      MSSIO7_EMMC_RST_N    => MSSIO7_EMMC_RST_N,
      MSS_LED0_N           => MSS_LED0_N,
      MSS_LED1_N           => MSS_LED1_N,
      MSS_RST_N            => MSS_RST_N,
      MSS_SGMII_TX0_N      => MSS_SGMII_TX0_N,
      MSS_SGMII_TX0_P      => MSS_SGMII_TX0_P,
      MSS_SGMII_TX1_N      => MSS_SGMII_TX1_N,
      MSS_SGMII_TX1_P      => MSS_SGMII_TX1_P,
      QSPI_CLK             => QSPI_CLK,
      QSPI_SS0             => QSPI_SS0,
      SD_CLK_EMMC_CLK      => SD_CLK_EMMC_CLK,
      USB_STP              => USB_STP,
      DDR4MSS_DQ           => DDR4MSS_DQ,
      DDR4MSS_DQS_N        => DDR4MSS_DQS_N,
      DDR4MSS_DQS_P        => DDR4MSS_DQS_P,
      ETH_MDIO             => ETH_MDIO,
      I2C_INT_N_MSS        => I2C_INT_N_MSS,
      I2C_MSS_SCL          => I2C_MSS_SCL,
      I2C_MSS_SDA          => I2C_MSS_SDA,
      MSSIO10_EMMC_IO6     => MSSIO10_EMMC_IO6,
      MSSIO11_EMMC_IO7     => MSSIO11_EMMC_IO7,
      MSSIO8_EMMC_IO4      => MSSIO8_EMMC_IO4,
      QSPI_DATA0           => QSPI_DATA0,
      QSPI_DATA1           => QSPI_DATA1,
      QSPI_DATA2           => QSPI_DATA2,
      QSPI_DATA3           => QSPI_DATA3,
      SD_CMD_EMMC_CMD      => SD_CMD_EMMC_CMD,
      SD_DATA0_EMMC_DATA0  => SD_DATA0_EMMC_DATA0,
      SD_DATA1_EMMC_DATA1  => SD_DATA1_EMMC_DATA1,
      SD_DATA2_EMMC_DATA2  => SD_DATA2_EMMC_DATA2,
      SD_DATA3_EMMC_DATA3  => SD_DATA3_EMMC_DATA3,
      SD_VSEL_EMMC_IO5     => SD_VSEL_EMMC_IO5,
      USB_DATA0            => USB_DATA0,
      USB_DATA1            => USB_DATA1,
      USB_DATA2            => USB_DATA2,
      USB_DATA3            => USB_DATA3,
      USB_DATA4            => USB_DATA4,
      USB_DATA5            => USB_DATA5,
      USB_DATA6            => USB_DATA6,
      USB_DATA7            => USB_DATA7,
      DDR4FPGA_PAR         => DDR4FPGA_PAR,
      DDR4FPGA_WE_N        => DDR4FPGA_WE_N,
      DDR4FPGA_ACT_N       => DDR4FPGA_ACT_N,
      DDR4FPGA_CAS_N       => DDR4FPGA_CAS_N,
      DDR4FPGA_RAS_N       => DDR4FPGA_RAS_N,
      DDR4FPGA_ALERT_N     => DDR4FPGA_ALERT_N,
      DDR4FPGA_RESET_N     => DDR4FPGA_RESET_N,
      SHIELD0              => SHIELD0,
      SHIELD1              => SHIELD1,
      SHIELD2              => SHIELD2,
      SHIELD3              => SHIELD3,
      SHIELD4              => SHIELD4,
      SHIELD5              => SHIELD5,
      SHIELD6              => SHIELD6,
      SHIELD7              => SHIELD7,
      DDR4FPGA_BA          => DDR4FPGA_BA,
      DDR4FPGA_BG          => DDR4FPGA_BG,
      DDR4FPGA_CKE         => DDR4FPGA_CKE,
      DDR4FPGA_DQ          => DDR4FPGA_DQ,
      DDR4FPGA_ODT         => DDR4FPGA_ODT,
      DDR4FPGA_A           => DDR4FPGA_A,
      DDR4FPGA_CK_N        => DDR4FPGA_CK_N,
      DDR4FPGA_CK_P        => DDR4FPGA_CK_P,
      DDR4FPGA_CS_N        => DDR4FPGA_CS_N,
      DDR4FPGA_DM          => DDR4FPGA_DM,
      DDR4FPGA_DQS_P       => DDR4FPGA_DQS_P,
      DDR4FPGA_DQS_N       => DDR4FPGA_DQS_N,
      I2C_SCL_FPGA         => I2C_SCL_FPGA,
      I2C_SDA_FPGA         => I2C_SDA_FPGA,
      I2C_SCL              => I2C_SCL,
      I2C_SDA              => I2C_SDA,
      FPGA_LED0_N          => open,
      FPGA_LED1_N          => FPGA_LED1_N,
      FPGA_LED2_N          => FPGA_LED2_N,
      FPGA_LED3_N          => FPGA_LED3_N,
      SDIO_SEL             => SDIO_SEL,
      TPM_SPI_CLK          => TPM_SPI_CLK,
      TPM_SPI_MISO         => TPM_SPI_MISO,
      TPM_SPI_MOSI         => TPM_SPI_MOSI,
      TPM_SPI_CS_N         => TPM_SPI_CS_N,
      UART_RX              => UART_RX,
      UART_TX              => UART_TX,
      UART_SEL             => UART_SEL
    );
  
  process (CLK50)
  begin
    if rising_edge (CLK50) then
      LedCount <= LedCount + 1;
    end if;
  end process;
  FPGA_LED0_N <= '0' when LedCount(LedCount'high) = '0' else '1';
  
  TPM_RST_N  <= '1';
  
end rtl;
