-- Total claims processed by year:

SELECT d.Year, COUNT(c.Claim_ID) AS Total_Claims
FROM Claims_Fact c
JOIN Date_Dimension d ON c.Date_ID = d.Date_ID
GROUP BY d.Year;

-- Average claim amount by pet type:

SELECT p.Pet_Type, AVG(c.Amount_Claimed) AS Average_Claim
FROM Claims_Fact c
JOIN Policy_Dimension pol ON c.Policy_ID = pol.Policy_ID
JOIN Pet_Dimension p ON pol.Policy_ID = p.Owner_ID
GROUP BY p.Pet_Type;

-- Claims status distribution by coverage type:

SELECT ct.Coverage_Description, COUNT(c.Claim_ID) AS Claim_Count
FROM Claims_Fact c
JOIN Policy_Dimension pol ON c.Policy_ID = pol.Policy_ID
JOIN Coverage_Type_Dimension ct ON pol.Coverage_Type_ID = ct.Coverage_Type_ID
GROUP BY ct.Coverage_Description;
