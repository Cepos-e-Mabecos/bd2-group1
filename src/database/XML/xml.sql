SELECT xmlelement(
	name value, 
	xmlattributes(comsumption_cod as comsumption),
	xmlelement( name nif, nif),
	xmlelement( name comsumption_date, comsumption_date)
)
FROM Comsumptions