import psycopg2


def create_db(conn):
    #  '''Функция создания структуру БД'''
    with conn.cursor() as cur:
        # cur.execute(
        #     """
        #     DROP TABLE phone;
        #     DROP TABLE clients;
        # """
        # )
    #   """Создаем таблицы с данными клтентов """
        # Таблица с именами, фамилиями и email клиентов
        cur.execute(
            "CREATE TABLE IF NOT EXISTS clients(id SERIAL PRIMARY KEY, first_name VARCHAR(40), last_name VARCHAR(40), email VARCHAR(40));"
        )
        # Таблица с телефонами
        cur.execute(
            "CREATE TABLE IF NOT EXISTS phone(id SERIAL PRIMARY KEY, client_id INTEGER REFERENCES clients(id), phone_number VARCHAR(40));"
        )
        conn.commit()

#   """Функция добавления клиентов и данных по ним"""
def add_client(conn, first_name, last_name, email, phone):
    with conn.cursor() as cur:
        cur.execute(
            # Создаем таблицу с данными клиентов(имена, фамилии, email)
            "INSERT INTO clients(first_name, last_name, email) VALUES(%s,%s,%s);",
            (first_name, last_name, email),
        )
        conn.commit()
    # Выбор id для вставки в client_id телефонной таблицы
        cur.execute(
            "SELECT id FROM clients where first_name = %s and last_name = %s;",
            (first_name, last_name))
        client_id = cur.fetchone()

    # Создаем таблицу с номерами телефонов клиентов с внешнем ключом clients(id)
        cur.execute(
            " INSERT INTO phone(client_id, phone_number) VALUES(%s,%s);",
            (client_id, phone)
        )
        conn.commit()

    # Вывод данных по таблицам
        cur.execute(
            """
                    SELECT * FROM clients;
                    """
        )
        print(cur.fetchall())
        cur.execute(
            """
                    SELECT * FROM phone;
                    """
        )
        print(cur.fetchall())


#   """Функция добавления телефонов клиентов"""
def add_phone(conn, first_name, last_name, phone):
    with conn.cursor() as cur:
        # selecting id to insert into phone table's client_id to ensure the phone number is added to the same person
        cur.execute(
            "SELECT id FROM clients where first_name = %s and last_name = %s;",
            (first_name, last_name))
        client_id = cur.fetchone()
        
        cur.execute(
            "INSERT INTO phone(client_id, phone_number) VALUES(%s,%s);",
            (client_id, phone),
        )
        conn.commit()
    

#  """Функция изменения данных клиента """
#     Изменение существующего клиента путем изменения его электронной почты
def change_client(conn, first_name, last_name, email):
    with conn.cursor() as cur:
        cur.execute(
            "SELECT id FROM clients where first_name = %s and last_name = %s;",
            (first_name, last_name))
        client_id = cur.fetchone()
        cur.execute(
            """ UPDATE clients
            SET email = %s where id = %s;""",
            (email, client_id)
        )
        conn.commit()


#   """Функция удаления телефонов клиентов"""
def delete_phone(conn, first_name, last_name, phone):
    with conn.cursor() as cur:
        cur.execute(
            "SELECT id FROM clients where first_name = %s and last_name = %s;",
            (first_name, last_name)
        )
        client_id = cur.fetchone()
        cur.execute(
            "DELETE from phone where client_id = %s and phone_number = %s;",
            (client_id, phone)
        )
        conn.commit()

#   """Функция удаления клиентов"""
def delete_client(conn, first_name, last_name):
    with conn.cursor() as cur:
        cur.execute(
            "SELECT id FROM clients where first_name = %s and last_name = %s;",
            (first_name, last_name))
        client_id = cur.fetchone()
    # Удаляем данные клиента из таблицы телефонов
        cur.execute(
            "DELETE FROM phone where client_id = %s;", (client_id)
        )
    # Удаляем данные клиента из таблицы с именами и email клиентов
        cur.execute(
            "DELETE FROM clients where id = %s;", (client_id)
        )
        conn.commit()


#   """Функция поиска клиентов"""
def find_client(conn, first_name, last_name):
    with conn.cursor() as cur:
        cur.execute(
            """
            SELECT first_name, last_name, email, phone_number FROM clients c FULL JOIN phone p on c.id = p.client_id 
            WHERE first_name =%s and last_name =%s;""", (first_name, last_name))
        print(cur.fetchall())


def main():
    with psycopg2.connect(database='clients_database', user='postgres', password='postgres') as conn:
        
        print('Инструкция по кодам')
        print()
        print('1 -- Добавить клиента', '2 -- Добавить телефон клиента', '3 -- Изменить данные клиента',\
        '4 -- Удалить телефон клиента', '5 -- Удалить клиента', '6 -- Найти клиента', '0 -- Выход', sep="\n")
        print()
        create_db(conn)
        
        while True:
            command = input('Введите номер команды: ')
         
            if command == '1':
                first_name = input('Введите имя клиента: ')
                last_name = input('Введите фамилию клиента: ')
                email = input('Введите email клиента: ')
                phone = int(input('Введите телефон клиента без "-": '))
                add_client(conn, first_name, last_name, email, phone)
                
            elif command == '2':
                first_name = input("Введите имя искомого клиента: ")
                last_name = input("Введите фамилию искомого клиента: ")
                phone = input("Введите добавляемый номер телефона без "-": ")
                add_phone(conn, first_name, last_name, phone)

            elif command == '3':
                first_name = input("Введите имя искомого клиента: ")
                last_name = input("Введите фамилию искомого клиента: ")
                email = input("Введите НОВЫЙ e-mail клиента: ")
                change_client(conn, first_name, last_name, email)

            elif command == '4':
                first_name = input("Введите имя искомого клиента: ")
                last_name = input("Введите фамилию искомого клиента: ")
                phone = input("Введите удаляемый номер без "-": ")
                delete_phone(conn, first_name, last_name, phone)

            elif command == '5':
                first_name = input("Введите имя искомого клиента: ")
                last_name = input("Введите фамилию искомого клиента: ")
                delete_client(conn, first_name, last_name)

            elif command == '6':
                first_name = input("Введите имя искомого клиента: ")
                last_name = input("Введите фамилию искомого клиента: ")
                find_client(conn, first_name, last_name)
            else:
                break
    conn.close()


if __name__ == "__main__":
    main()
