library ieee;
use Std.TextIO.all;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

package debugtools is

  function safe_to_integer(sv : unsigned) return integer;

  alias to_string is ieee.std_logic_1164.to_string [std_logic_vector return string];
  alias to_hstring is ieee.std_logic_1164.to_hstring [std_logic_vector return string];
  alias to_hstring is ieee.numeric_std.to_hstring [unsigned return string];
  alias to_hstring is ieee.numeric_std.to_hstring [signed return string];

end debugtools;

package body debugtools is

  function safe_to_integer(sv : unsigned) return integer is
    variable v : integer := 0;
    variable p : integer := 0;
  begin
    for i in sv'low to sv'high loop
      if sv(i)='1' then
        v := v + (2**p);
      elsif sv(i) /= '0' then
        report "Bit #" & integer'image(i) & " of %" & to_string(std_logic_vector(sv)) & " is not 1 or 0, but " & std_logic'image(sv(i)) & ".";
      end if;
      p := p + 1;
    end loop;
    return v;
  end;

end debugtools;
