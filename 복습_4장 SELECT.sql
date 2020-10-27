/*1. 급여가 1500 이하인 사원의 사원번호, 사원 이름, 급여를 출력하는 SQL 문
을 작성해 보시오. */
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL <= 1500;
/*2. 사원이름이 SCOTT 인 사원의 사원번호, 사원 이름, 급여를 출력하는 SQL
문을 작성해 보시오.*/
SELECT EMPNO, ENAME, SAL FROM EMP WHERE ENAME = 'SCOTT';
/*3. 사원 번호가 7521 이거나 7654 이거나 7844 인 사원들의
사원 번호와 급여를 검색하는 쿼리문을 비교 연산자와 OR 논리 연산자 사
용하여 작성하시오.*/
SELECT EMPNO, SAL FROM EMP WHERE EMPNO = 7521 OR EMPNO = 7654 OR EMPNO = 7844;
/*4. 7521 이거나 7654 이거나 7844 인 사원들을 검색하는 쿼리문을 비교 연산
자와 논리 연산자 OR로 작성할 수 있지만, 이번에는 IN 연산자를 사용하여
작성해 보시오.*/
SELECT * FROM EMP WHERE EMPNO IN(7521,7654,7844);
/*사원 번호가 7521도 아니고 7654도 아니고 7844도 아닌 사원들을 검색하는
쿼리문을 작성하시오.
5.1. 비교 연산자와 논리 연산자 AND를 사용하여 작성하기
5.2. NOT IN 연산자를 사용하여 작성하기*/
SELECT * FROM EMP WHERE EMPNO NOT IN(7521,7654,7844);
SELECT * FROM EMP WHERE EMPNO != 7521 AND EMPNO <>7654 AND EMPNO ^=7844;
/*6. 사원들 중에서 이름이 J로 시작하는 사람만을 찾는 쿼리문을 작성해 보시오.*/
SELECT * FROM EMP WHERE ENAME LIKE 'J%';
--7. 이번에는 이름 중 A를 포함하는 사원을 검색해 봅시다.
SELECT * FROM EMP WHERE ENAME LIKE '%A%';
/*7. 와일드 카드를 사용하여 다음 조건에 만족하는 쿼리문을 작성하시오.
7.1. 사원들 중에서 이름이 K로 시작하는 사원의 사원번호와 사원이름을 출력
하시오.*/
SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE 'K%';
--7.2. 이름 중에 K를 포함하는 사원의 사원번호와 사원이름을 출력하시오.
SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE '%K%';
--7.3. 이름이 K로 끝나는 사원의 사원번호와 사원이름을 출력하시오.
SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE '%K';
/*8. 상관이 없는 사원(CEO 가 되겠지요!)을 검색하기 위한 SQL 문을 작성해 보
시오.
<힌트> 사원 정보가 저장된 테이블의 이름은 EMP이고, 사원 테이블에는 상관
의 사원번호를 저장하는 MGR 칼럼이 존재합니다. MGR 컬럼에 NULL이 저
장되어 있으면 CEO가 되겠지요.^^*/
SELECT * FROM EMP WHERE MGR IS NULL;
/*9. EMP 테이블의 자료를 입사일을 오름차순으로 정렬하여 최근 입사한 직원을
먼저 출력하되 사원번호, 사원명, 직급, 입사일 칼럼을 출력하는 쿼리문을
작성하시오. */
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP ORDER BY HIREDATE ASC;
--10. EMP 테이블의 자료를 사원번호를 기준으로 오름차순으로 정렬하여 사원 번호와 사원명 칼럼을 표시하시오.
SELECT EMPNO, ENAME FROM EMP ORDER BY EMPNO ASC;
/*11. 부서 번호가 빠른 사원부터 출력하되 같은 부서내의 사원을 출력할 경우 최
근에 입사한 사원부터 출력하도록 하되 사원 번호, 입사일, 사원 이름, 급여
순으로 출력하시오.*/
SELECT EMPNO, HIREDATE, ENAME, SAL FROM EMP ORDER BY DEPTNO ASC, HIREDATE DESC;

 /* 4장 SELECT로 특정 데이터를 추출하기
 조건절 이용 WHERE 컬럼 (연산자)(비교값)
 비교연산자(=,>,<,<=,>=,!=,<>,^=)/ 논리연산자(AND, OR, NOT)
  - AND 연산자로 각 데이터의 사이값 (EX 2000이상 3000이하) 추출대신 같은 결과를 더 간단하게 도출할수 있다
    컬럼명 BETWEEN 2000 AND 3000
  - 같은 컬럼의 데이터값에 대하여 OR 연산자로 구하려할때 그 특정 데이터값이 여럿일 때 
    컬럼명 IN(데이터1,데이터2,데이터3)
  - 논리연산자의 반대값은 연산자 앞에 NOT 을 기재하여 구할수 있다
    NOT BETWEEN A AND B, NOT IN(A,B,C)
  - 중요한 데이터값이지만 ? 또는 무한으로 비교가 불가한 NULL에 대해 NULL인지 아닌지는 IS NULL 로 확인한다
 ORDER BY 컬럼명 으로 데이터값을 정렬할수 있다
 ASC(오름차순), DESC(내림차순), 디폴트값은 ASC(오름차순)
 