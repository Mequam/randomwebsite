SELECT createplaylist('Sound Mess');

SELECT createVidInPlayList(
		(SELECT currval(pg_get_serial_sequence('playlist', 'pla_id')))::integer,
		'videos/soundMess/week1/week1.mp4',
		'videos/soundMess/week1/thumbnail.png',
		'Adding A Silo Boss To My Game');
SELECT createVidInPlayList(
	(SELECT currval(pg_get_serial_sequence('playlist', 'pla_id')))::integer,
	'videos/soundMess/week2/week2.mp4',
	'videos/soundMess/week2/thumbnail.png',
	'More Silo Boss!');

SELECT createplaylist('Not Sound Mess');
SELECT createVidInPlayList(
	(SELECT currval(pg_get_serial_sequence('playlist', 'pla_id')))::integer,
	'videos/soundMess/week2/week2.mp4',
	'videos/soundMess/week2/thumbnail.png',
	'dev video for db tests :D');


