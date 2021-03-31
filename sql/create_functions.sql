CREATE OR REPLACE FUNCTION createVid(src varchar,thumb varchar,title varchar) RETURNS INTEGER AS $$
	BEGIN
		INSERT INTO 
			video(vid_update,vid_source,vid_title,vid_thumb) 
			VALUES(NOW(),src,title,thumb);
		RETURN (SELECT LASTVAL());
	END;
$$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION addVid2Playlist(vid_id integer,pla_id integer) RETURNS VOID AS $$
        BEGIN
                INSERT INTO playlist2vid(pla_id,vid_id) VALUES(pla_id,vid_id);
        END;
$$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION createVidInPlaylist(pla_id integer,src varchar,thumb varchar,title varchar) RETURNS VOID AS $$
	BEGIN		
		PERFORM addVid2PlayList((SELECT createVid(src,thumb,title)),pla_id);
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION createPlaylist(title varchar) RETURNS integer AS $$
	BEGIN
		INSERT INTO playlist(pla_title) VALUES(title);
		RETURN (SELECT LASTVAL());
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION videosInPlayList(pla_id_arg integer) RETURNS TABLE(vid_id integer,vid_update date,vid_source varchar,vid_title varchar) 
	AS $$ 
		SELECT video.vid_id,video.vid_update,video.vid_source,video.vid_title 
		FROM video INNER JOIN (SELECT * FROM playlist2vid WHERE playlist2vid.pla_id=pla_id_arg) AS t1 ON t1.vid_id=video.vid_id 
	$$ 
LANGUAGE SQL;
