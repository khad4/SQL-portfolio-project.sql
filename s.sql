
Select *
From portfolioLuka..CovidDeaths$
Where continent is not null 
order by 3,4 DESC


-- Select Data that we are going to be starting with

Select Location, date, total_cases, new_cases, total_deaths, population
From portfolioLuka..CovidDeaths$
Where continent is not null 
order by 1,2

-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country

Select Location, date, total_cases,total_deaths, FORMAT((total_deaths/total_cases)*100,'N2') as DeathPercentage
From portfolioLuka..CovidDeaths$
Where location like '%states%'
and continent is not null 
order by 1,2



-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

Select Location, date, Population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
From portfolioLuka..CovidDeaths$
order by 1,2



-- Countries with Highest Infection Rate compared to Population


Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From portfolioLuka..CovidDeaths$
Group by Location, Population
order by PercentPopulationInfected desc


-- Countries with Highest Death Count per Population


Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From portfolioLuka..CovidDeaths$
Where continent is not null 
Group by Location
order by TotalDeathCount desc



-- Showing contintents with the highest death count per population

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From portfolioLuka..CovidDeaths$
Where continent is not null 
Group by continent
order by TotalDeathCount desc




Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, FORMAT(SUM(cast(new_deaths as int))/SUM(New_Cases)*100,'N3') as DeathPercentage
From portfolioLuka..CovidDeaths$
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2
