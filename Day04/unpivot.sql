CREATE TABLE unpivot
    AS
        SELECT
            *
        FROM
            (
                SELECT
                    deptno,
                    job,
                    empno
                FROM
                    emp
            ) PIVOT (
                COUNT(empno)
                FOR job
                IN ( 'CLERK' AS "CLERK", 'MANAGER' AS "MANAGER", 'PRESIDENT' AS "PRESIDENT", 'ANALYST' AS "ANALYST", 'SALESMAN' AS "SALESMAN"
                )
            );

SELECT
    *
FROM
    unpivot;


--
SELECT
    *
FROM
    unpivot UNPIVOT ( empno
        FOR job
    IN ( clerk,
         manager,
         president,
         analyst,
         salesman ) );




--lag함수
--이전행 가져오기

SELECT
    ename,
    hiredate,
    sal,
    LAG(sal, 1, 0)
    OVER(
        ORDER BY
            hiredate
    )
FROM
    emp;



-- 부서별 파티션 나누기
SELECT
    ename,
    deptno,
    hiredate,
    sal,
    LAG(sal, 1, 0)
    OVER(PARTITION BY deptno
         ORDER BY
             hiredate
    ) AS prev_sal
FROM
    emp;


--
SELECT
    ename,
    deptno,
    job,
    hiredate,
    sal,
    LAG(sal, 1, 0)
    OVER(PARTITION BY deptno, job
         ORDER BY
             hiredate
    ) AS prev_sal
FROM
    emp;




--lead(): 다음행 가져오기  이후 값 가져오기
SELECT
    ename,
    hiredate,
    sal,
    LEAD(sal, 2, 1)
    OVER(
        ORDER BY
            hiredate
    )
FROM
    emp;