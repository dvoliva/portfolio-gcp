from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime

def print_hello():
    print("¡Hola, Mundo desde Airflow!")

dag = DAG('hello_world_dag', description='Un simple DAG de prueba',
          schedule_interval='@once', start_date=datetime(2024, 12, 15), catchup=False)

hello_task = PythonOperator(task_id='hello_task', python_callable=print_hello, dag=dag)
