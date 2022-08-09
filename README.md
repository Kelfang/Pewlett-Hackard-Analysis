# Pewlett Hackard Retirement Analysis

## Project Overview
The purpose of this project is to assess the following:
  1.	Determine the number of retiring employees, specific to their title.
  2.	Identify employees who are eligible to participate in a mentorship program.
  
  Understanding these two metrics will enable the organization to put a program in place that will ensure a smooth transition of knowledge and workload as employees retire from the company.

## Resources
  * Languages: SQL
  * Tools: pgAdmin, VS Code, Excel 
  * Data Sources: multiple csv files provided by Pewlett Hackard

## Summary of Results
The project was simple and straightforward. The data received was clean without errors or missing values. The biggest challenge was the amount of data spread across multiple files. One of the most important steps of this process was to make certain we were evaluating data that was current. Many of the employees have held several titles during their tenure with the company so identifying current roles and removing the (older) duplicated data was necessary to get accurate counts and the titles of positions that would be vacated.
 
 An item of note when reviewing this data, in the "to_date" field employees that are still working at Pewlett Hackard have "1/1/99" listed. This date allowed us to identify an employee’s current title and remove the employee's other rows of data to ensure they were only being counted once. Below you will see the data before duplicates were removed and then the results once it was filtered by the 1/1/99 date.

<sub>Employees Eligible for Retirement</sub>

![retirement_titles_original](https://github.com/Kelfang/Pewlett-Hackard-Analysis/blob/main/images/retirement_titles_original.png)


<sub>Employees Eligible for Retirement – Duplicates Removed</sub>

![retirement_titles_dups_removed](https://github.com/Kelfang/Pewlett-Hackard-Analysis/blob/main/images/retirement_titles_dups_removed.png)

After removing the duplicates, this left us with a total number of 72,458 employees that were born between January 1, 1952, through December 31, 1955. That’s a lot of people exiting within a three-year time span! It also assumes that these individuals will wait until they reach a certain age prior to retiring. Some might opt to exit sooner, while others may want to stay on longer. This is data that would be worth validating with the employee themselves. 

Most notably, the largest group is Senior Engineer which is a highly technical role that requires employees to have a deeper knowledge base and more years’ experience than the role of Engineer. This is definitely a cause for concern as there might not be enough Engineers ready to move into the Senior Engineer role and then those Engineers will likely need to be backfilled as well. Below is a breakdown of employee count by title. 

<sub>Retirement Count by Title</sub>

![retirement_count_by_title](https://github.com/Kelfang/Pewlett-Hackard-Analysis/blob/main/images/retirement_count_by_title.png)

While the numbers are intimidating, this data certainly validates the need for a succession and mentoring plan. Within the data provided, we can ascertain who might be eligible to become a mentor to existing (or new) employees that will step into these vacancies. These individuals were identified by current employment status and the birth year of 1965. The intention behind that date is to identify long(er) term employees who are still several years away from retirement themselves. Here is a breakdown of those numbers, by title. 

<sub>Mentor Eligible by Title</sub>

![mentor_eligible_by_title](https://github.com/Kelfang/Pewlett-Hackard-Analysis/blob/main/images/mentor_eligible_by_title.png)

If you look at numbers of the last two images, you’ll see that for every 1 Senior Engineer mentor they would need to take on 49 vacancies in the Senior Engineer role. More concerning, for every 1 Senior Staff mentor they would need to take on 168 vacancies. That’s an impossible task to ask of anyone who is also continuing to perform their own day-to-day duties.

I did discover by expanding the birthdate of the mentorship eligibility from 1 year (1965) to 3 years (1963 through 1966) the ratio of mentors to employees is far more favorable.  For instance, the number of Senior Engineers that would be eligible for mentorship using the 3-year range jumps from 528 to 3,791. The Senior Staff mentor numbers also increases significantly from 148 to 13,391. We also add another title, “Manager”, by expanding the filter. This larger age filter could ensure the success and sustainability of a mentorship program because the workload would be far more manageable for the mentors. Below I sorted the data by title so you can easily see the differences between the one year versus three-year filter.

<sub>Three Year vs. One Year</sub>

![three_vs_one_year_mentor](https://github.com/Kelfang/Pewlett-Hackard-Analysis/blob/main/images/three_vs_one_year_mentor.png)

### Final Thoughts
Overall, there are a lot of opportunities to further refine this data and enhance the probability of having a successful mentorship program. The data tells us two things:

  1.	There are a lot of employees who will be broaching retirement very soon so this needs to be a high priority for the organization.
  2.	There are too few employees who are eligible for the mentorship program using a one-year filter on the birth year range. This means Pewlett Hackard will need to expand their criteria to find more qualified candidates to fulfill the mentorship role. 

I recommend that the organization run queries to evaluate how long someone has been in a specific role and determine what length of time a qualified mentor should have in that role, regardless of birth year. There could be some opportunity for those that held a role previously to still be qualified to train in that role. For example, a Technique Leader might have previously been a Senior Engineer for five years and is qualified to train both an Engineer and Senior Engineer. Another avenue could be incentivizing those seeking to retire to prolong their employment and/or train their replacements.
