# Tabela 1
select t1.placeID, t1.name, t2.rating
from t1, t2
where t1.placeID = t2.placeID
    and franchise = "f"
    and alcohol != "No_Alcohol_Served"
    and t2.rating = 2;

# Tabela 2
select distinct t1.placeID, t1.name, t2.rating
from t1, t2
where t1.placeID = t2.placeID
    and franchise = "f"
    and alcohol != "No_Alcohol_Served"
    and t2.rating = 2;
    