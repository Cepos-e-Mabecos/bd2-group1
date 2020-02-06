
CREATE OR REPLACE FUNCTION Select_xml()
   RETURNS text AS $$
DECLARE 
    titles TEXT DEFAULT '';
    rec_film   RECORD;
    cur_films CURSOR
       FOR SELECT xmlelement(
			name value, 
			xmlattributes(restaurant_cod as restaurant_cod),
			xmlelement( name local_cod, local_cod),
			xmlelement( name designation, designation)
		)
		FROM Restaurants;
BEGIN
   -- Open the cursor
   OPEN cur_films;
   
   LOOP
    -- fetch row into the film
      FETCH cur_films INTO rec_film;
    -- exit when no more row to fetch
      EXIT WHEN NOT FOUND;
         titles := titles || rec_film;
   END LOOP;
  
   -- Close the cursor
   CLOSE cur_films;
 
   RETURN titles;
END; $$
LANGUAGE plpgsql;
