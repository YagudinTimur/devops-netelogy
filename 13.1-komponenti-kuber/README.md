# Домашнее задание к занятию «Компоненты Kubernetes»

> ### Цель задания

> Рассчитать требования к кластеру под проект

------

> ### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания:

> - [Considerations for large clusters](https://kubernetes.io/docs/setup/best-practices/cluster-large/),
> - [Architecting Kubernetes clusters — choosing a worker node size](https://learnk8s.io/kubernetes-node-size).

------

> ### Задание. Необходимо определить требуемые ресурсы
> Известно, что проекту нужны база данных, система кеширования, а само приложение состоит из бекенда и фронтенда. Опишите, какие ресурсы нужны, если известно:

> 1. Необходимо упаковать приложение в чарт для деплоя в разные окружения. 
> 2. База данных должна быть отказоустойчивой. Потребляет 4 ГБ ОЗУ в работе, 1 ядро. 3 копии. 
> 3. Кеш должен быть отказоустойчивый. Потребляет 4 ГБ ОЗУ в работе, 1 ядро. 3 копии. 
> 4. Фронтенд обрабатывает внешние запросы быстро, отдавая статику. Потребляет не более 50 МБ ОЗУ на каждый экземпляр, 0.2 ядра. 5 копий. 
> 5. Бекенд потребляет 600 МБ ОЗУ и по 1 ядру на копию. 10 копий.

-----
### Решение:


## Требования к кластеру

| Компонент   | Ресурсы (ОЗУ) | Ресурсы (ядра) | Количество копий |
|-------------|--------------|----------------|------------------|
| База данных | 4 ГБ         | 1              | 3                |
| Кеш         | 4 ГБ         | 1              | 3                |
| Фронтенд    | 50 МБ        | 0.2            | 5                |
| Бекенд      | 600 МБ       | 1              | 10               |

## Расчет ресурсов кластера

Для расчета требуемых ресурсов кластера, мы должны учесть суммарное количество ресурсов каждого компонента и количество его копий.

### ОЗУ (RAM)

Общее требуемое количество ОЗУ определяется суммой ОЗУ каждого компонента, умноженной на количество его копий.

Общее требуемое количество ОЗУ = (ОЗУ компонента * Количество копий)

- База данных: 4 ГБ * 3 = 12 ГБ
- Кеш: 4 ГБ * 3 = 12 ГБ
- Фронтенд: 50 МБ * 5 = 250 МБ
- Бекенд: 600 МБ * 10 = 6000 МБ 

### Ядра (CPU)

Общее требуемое количество ядер определяется суммой ядер каждого компонента, умноженной на количество его копий.

Общее требуемое количество ядер = (Ядра компонента * Количество копий)

- База данных: 1 * 3 = 3
- Кеш: 1 * 3 = 3
- Фронтенд: 0.2 * 5 = 1
- Бекенд: 1 * 10 = 10

Таким образом, требуемые ресурсы для вашего кластера будут следующими:

- Общее требуемое количество ОЗУ: 12 ГБ + 12 ГБ + 250 МБ + 6 ГБ = 18.25 ГБ
- Общее требуемое количество ядер: 3 + 3 + 1 + 10 = 17

Но всегда нужно иметь ввиду, что в реальной ситуации может потребоваться дополнительная память и ядра для обеспечения надежности и производительности.