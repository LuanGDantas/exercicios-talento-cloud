CREATE OR REPLACE FUNCTION total_clientes_do_dia(p_data IN DATE)
RETURN NUMBER IS
BEGIN
  RETURN (SELECT COUNT(*) FROM clientes WHERE data_cadastro = p_data);
END total_clientes_do_dia;