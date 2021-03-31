CREATE TABLE video(
vid_Id		SERIAL PRIMARY KEY, --primary key for videos, serial is auto
vid_upDate	Date,
vid_source	VarChar(400),
vid_thumb	VarChar(400),
vid_title	VarChar(200));

CREATE TABLE playlist(
pla_id	SERIAL PRIMARY KEY,
pla_title	VarChar(200));

CREATE TABLE playlist2vid(
pla_id	INT,
vid_id	INT,
PRIMARY KEY (pla_id,vid_id),
CONSTRAINT safe_pla_id
	FOREIGN KEY(pla_id)
		REFERENCES playlist(pla_id),
CONSTRAINT safe_vid_id
	FOREIGN KEY(vid_id)
		REFERENCES video(vid_id)

);
