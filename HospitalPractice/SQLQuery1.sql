USE Hospital

-- 1. ������� ���������� �����, ����������� ������� ������ 10.
SELECT COUNT(*) AS [Count]
FROM Wards
WHERE [Places] > 10

-- 2.������� �������� �������� � ���������� ����� � ������ �� ���.
SELECT D.[Name] AS [DepartmentName], COUNT(W.[Id]) AS [NumberOfWards]
FROM [Departments] D
JOIN Wards W ON D.[Id] = W.[DepartmentId]
GROUP BY D.[Name] 

-- 3. ������� �������� ��������� � ���������� ����� � ������ �� ���.
SELECT D.Building AS [BuildingName], COUNT(W.[Id]) AS [NumberOfWards]
FROM [Departments] D
LEFT JOIN [Wards] W ON D.[Id] = W.[DepartmentId]
GROUP BY D.Building;

-- 4. ������� �������� ��������� � ��������� �������� ������ � ������ �� ���.
SELECT D.[Name] AS [DepartmentName], SUM(Doc.[Premium]) AS [TotalPremium]
FROM [Departments] D
JOIN [Doctors] Doc ON D.[Id] = Doc.[Id]
GROUP BY D.[Name];

-- 5. ������� �������� ���������, � ������� �������� ������������ 5 � ����� ������.

-- 6.������� ���������� ������ � �� ��������� �������� (����� ������ � ��������).

-- 7. ������� ������� �������� (����� ������ � ��������) ������.

-- 8. ������� �������� ����� � ����������� ����������������.

-- 9. ������� � ����� �� �������� 1, 6, 7 � 8, ��������� ���������� ���� � ������� ��������� 100. 
-- ��� ���� ��������� ������ ������ � ����������� ���� ������ 10.


