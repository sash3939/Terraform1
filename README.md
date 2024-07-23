# Домашнее задание к занятию «Введение в Terraform»

### Цели задания

1. Установить и настроить Terrafrom.
2. Научиться использовать готовый код.

------

### Чек-лист готовности к домашнему заданию

1. Скачайте и установите **Terraform** версии ~>1.8.4 . Приложите скриншот вывода команды ```terraform --version```.

![terraform,docker,git version](https://github.com/user-attachments/assets/3b4841d2-a4cf-4c6c-b108-baa6cf5c7c3d)
---
   
2. Скачайте на свой ПК этот git-репозиторий. Исходный код для выполнения задания расположен в директории **01/src**.

![src from homework](https://github.com/user-attachments/assets/59765551-3354-48f5-9da2-92355d4aaf4d)
---

3. Убедитесь, что в вашей ОС установлен docker.

![terraform,docker,git version](https://github.com/user-attachments/assets/4804b34a-a014-4161-afe9-cbf133d40898)
---

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. Репозиторий с ссылкой на зеркало для установки и настройки Terraform: [ссылка](https://github.com/netology-code/devops-materials).
2. Установка docker: [ссылка](https://docs.docker.com/engine/install/ubuntu/). 
------
### Внимание!! Обязательно предоставляем на проверку получившийся код в виде ссылки на ваш github-репозиторий!
------

### Задание 1

1. Перейдите в каталог [**src**](https://github.com/netology-code/ter-homeworks/tree/main/01/src). Скачайте все необходимые зависимости, использованные в проекте.

Скачал

2. Изучите файл **.gitignore**. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)

Согласно файлу .gitignore, единственным terraform-файлом, в котором допустимо сохранить личную, секретную информацию (логины, пароли, ключи, токены и т.д.), является файл с именем personal.auto.tfvars.
В .gitignore указано, что этот файл не будет игнорироваться (он не находится под действием правил, исключающих другие файлы или директории terraform). Поэтому, можно сохранить личную информацию в файле personal.auto.tfvars и этот файл будет учитываться системой контроля версий. Но это небезопасно.

![gitignore](https://github.com/user-attachments/assets/3ce317dc-62fc-4757-b325-b56c1d93fa3b)
---

3. Выполните код проекта. Найдите  в state-файле секретное содержимое созданного ресурса **random_password**, пришлите в качестве ответа конкретный ключ и его значение.

![Statefile and secrets](https://github.com/user-attachments/assets/470f05dc-b9f2-42c3-ac6b-15215444dda6)
---
   
4. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла **main.tf**.
Выполните команду ```terraform validate```. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.

![terraform validate](https://github.com/user-attachments/assets/7856709a-b56b-4e71-af7c-6e5531ac9828)
---

- Отсутствие имени ресурса для docker_image.
- Неверное имя ресурса docker_container, так как оно начинается с цифры.
- Опечатка в имени переменной random_password в ресурсе docker_container.

![terraform validate done](https://github.com/user-attachments/assets/d93b0ff2-435d-45e5-90db-3c7d6b7d14bd)
---

5. Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды ```docker ps```.

![true code fragment](https://github.com/user-attachments/assets/51183e69-cf6f-4c2c-b6c4-8c35cf12e20e)
---

![docker ps](https://github.com/user-attachments/assets/801afb27-b974-4532-b735-08193139ed36)
---

6. Замените имя docker-контейнера в блоке кода на ```hello_world```. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду ```terraform apply -auto-approve```.
Объясните своими словами, в чём может быть опасность применения ключа  ```-auto-approve```. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды ```docker ps```.

Запускаем terraform apply -auto-approve, и смотрим docker ps, имя конетйнера поменялось без нашего подтверждения

![terraform apply -auto-approve](https://github.com/user-attachments/assets/d7855067-ff53-4424-bc72-95222d3385aa)
---

Ключ -auto-approve в команде terraform apply автоматически подтверждает выполнение всех изменений, не запрашивая у пользователя дополнительного подтверждения. Это может быть опасно по следующим причинам:

- Непредвиденные изменения: Вы можете случайно применить изменения, которые не планировали, что может привести к удалению или изменению важных ресурсов.
- Ошибки конфигурации: Из-за отсутствия проверки и подтверждения вы можете не заметить ошибки в конфигурации, которые могут привести к сбоям в работе инфраструктуры.
- Отсутствие контроля: В производственной среде это может привести к непреднамеренному нарушению работы сервисов или безопасности, так как изменения могут быть применены без должного контроля.

Ключ -auto-approve полезен в следующих сценариях:

- Автоматизация: В скриптах автоматизации или CI/CD пайплайнах, где требуется непрерывное развертывание или обновление инфраструктуры без вмешательства человека.
- Тестирование: При написании тестов для проверки конфигурации Terraform, чтобы ускорить процесс применения изменений.
- Быстрое развертывание: В ситуациях, где требуется быстрое развертывание инфраструктуры без задержек на подтверждение.



7. Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**. 

![terraform destroy](https://github.com/user-attachments/assets/cc0e0264-6e76-4107-b34d-1f748cb324a3)
---

![terraform tfstate](https://github.com/user-attachments/assets/f8e451cc-2a03-490c-a0cd-541d53278482)
---


8. Объясните, почему при этом не был удалён docker-образ **nginx:latest**. Ответ **ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ**, а затем **ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ** строчкой из документации [**terraform провайдера docker**](https://docs.comcloud.xyz/providers/kreuzwerker/docker/latest/docs).  (ищите в классификаторе resource docker_image )

Docker image nginx:latest не был удален, потому что потому что использовали параметр keep_locally = true при создании image.

![keep_locally](https://github.com/user-attachments/assets/7029fcba-4de0-48c4-9140-2405420a2738)
---

https://docs.comcloud.xyz/providers/kreuzwerker/docker/latest/docs/resources/image#keep_locally

------

## Дополнительное задание (со звёздочкой*)

**Настоятельно рекомендуем выполнять все задания со звёздочкой.** Они помогут глубже разобраться в материале.   
Задания со звёздочкой дополнительные, не обязательные к выполнению и никак не повлияют на получение вами зачёта по этому домашнему заданию. 

### Задание 2*

1. Создайте в облаке ВМ. Сделайте это через web-консоль, чтобы не слить по незнанию токен от облака в github(это тема следующей лекции). Если хотите - попробуйте сделать это через terraform, прочитав документацию yandex cloud. Используйте файл ```personal.auto.tfvars``` и гитигнор или иной, безопасный способ передачи токена!
2. Подключитесь к ВМ по ssh и установите стек docker.
3. Найдите в документации docker provider способ настроить подключение terraform на вашей рабочей станции к remote docker context вашей ВМ через ssh.
4. Используя terraform и  remote docker context, скачайте и запустите на вашей ВМ контейнер ```mysql:8``` на порту ```127.0.0.1:3306```, передайте ENV-переменные. Сгенерируйте разные пароли через random_password и передайте их в контейнер, используя интерполяцию из примера с nginx.(```name  = "example_${random_password.random_string.result}"```  , двойные кавычки и фигурные скобки обязательны!) 
```
    environment:
      - "MYSQL_ROOT_PASSWORD=${...}"
      - MYSQL_DATABASE=wordpress
      - MYSQL_USER=wordpress
      - "MYSQL_PASSWORD=${...}"
      - MYSQL_ROOT_HOST="%"
```

6. Зайдите на вашу ВМ , подключитесь к контейнеру и проверьте наличие секретных env-переменных с помощью команды ```env```. Запишите ваш финальный код в репозиторий.

### Задание 3*
1. Установите [opentofu](https://opentofu.org/)(fork terraform с лицензией Mozilla Public License, version 2.0) любой версии
2. Попробуйте выполнить тот же код с помощью ```tofu apply```, а не terraform apply.
------

### Правила приёма работы

Домашняя работа оформляется в отдельном GitHub-репозитории в файле README.md.   
Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

### Критерии оценки

Зачёт ставится, если:

* выполнены все задания,
* ответы даны в развёрнутой форме,
* приложены соответствующие скриншоты и файлы проекта,
* в выполненных заданиях нет противоречий и нарушения логики.

На доработку работу отправят, если:

* задание выполнено частично или не выполнено вообще,
* в логике выполнения заданий есть противоречия и существенные недостатки. 
