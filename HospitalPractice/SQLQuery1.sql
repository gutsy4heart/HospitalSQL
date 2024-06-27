USE Hospital

-- 1. Вывести количество палат, вместимость которых больше 10.
SELECT COUNT(*) AS [Count]
FROM Wards
WHERE [Places] > 10

-- 2.Вывести названия корпусов и количество палат в каждом из них.
SELECT D.[Name] AS [DepartmentName], COUNT(W.[Id]) AS [NumberOfWards]
FROM [Departments] D
JOIN Wards W ON D.[Id] = W.[DepartmentId]
GROUP BY D.[Name] 

-- 3. Вывести названия отделений и количество палат в каждом из них.
SELECT D.Building AS [BuildingName], COUNT(W.[Id]) AS [NumberOfWards]
FROM [Departments] D
LEFT JOIN [Wards] W ON D.[Id] = W.[DepartmentId]
GROUP BY D.Building;

-- 4. Вывести названия отделений и суммарную надбавку врачей в каждом из них.
SELECT D.[Name] AS [DepartmentName], SUM(Doc.[Premium]) AS [TotalPremium]
FROM [Departments] D
JOIN [Doctors] Doc ON D.[Id] = Doc.[Id]
GROUP BY D.[Name];

-- 5. Вывести названия отделений, в которых проводят обследования 5 и более врачей.

-- 6.Вывести количество врачей и их суммарную зарплату (сумма ставки и надбавки).

-- 7. Вывести среднюю зарплату (сумма ставки и надбавки) врачей.

-- 8. Вывести названия палат с минимальной вместительностью.

-- 9. Вывести в каких из корпусов 1, 6, 7 и 8, суммарное количество мест в палатах превышает 100. 
-- При этом учитывать только палаты с количеством мест больше 10.


