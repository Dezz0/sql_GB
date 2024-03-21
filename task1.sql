CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(255)
BEGIN
  DECLARE days INT;
  DECLARE hours INT;
  DECLARE minutes INT;
  DECLARE remaining_seconds INT;
  DECLARE result VARCHAR(255);

  SET days = FLOOR(seconds / 86400);
  SET hours = FLOOR((seconds % 86400) / 3600);
  SET minutes = FLOOR(((seconds % 86400) % 3600) / 60);
  SET seconds = ((seconds % 86400) % 3600) % 60;

  SET result = CONCAT(
    CASE WHEN days > 0 THEN CONCAT(days, ' days ') ELSE '' END,
    CASE WHEN hours > 0 THEN CONCAT(hours, ' hours ') ELSE '' END,
    CASE WHEN minutes > 0 THEN CONCAT(minutes, ' minutes ') ELSE '' END,
    CASE WHEN seconds > 0 THEN CONCAT(seconds, ' seconds ') ELSE '' END
  );

  RETURN result;
END;

