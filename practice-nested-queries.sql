#1
SELECT * 
FROM invoice
WHERE invoice_id IN (
	SELECT invoice_id 
  FROM invoice_line
	WHERE unit_price > 0.99
);

#2
SELECT *
FROM playlist_track
WHERE playlist_id IN (
	SELECT playlist_id 
	FROM playlist
	WHERE name = 'Music'
); 

