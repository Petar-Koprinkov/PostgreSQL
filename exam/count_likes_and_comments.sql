SELECT
	p.id,
	(SELECT COUNT(*) FROM  likes AS l WHERE l.photo_id = p.id) AS likes_count,
	(SELECT COUNT(*) FROM comments AS c WHERE c.photo_id = p.id) AS comments_count
FROM
	photos AS p
ORDER BY
	likes_count DESC,
	comments_count DESC,
	p.id;
