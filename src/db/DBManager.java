package db;

import models.Tasks;

import java.util.ArrayList;

public class DBManager {
    public static ArrayList<Tasks> taskArrayList = new ArrayList<>();

    static {
        taskArrayList.add(new Tasks(1L, "Создать веб приложение на Java EE", "", "2024-02-07", true));
        taskArrayList.add(new Tasks(2L, "Создать веб приложение на Java EE", "123", "2024-02-07", false));
    }

    public static void addTask(Tasks task) {
        taskArrayList.add(task);
    }

    public static Tasks getTask(Long id) {
        for (Tasks task : taskArrayList) {
            if (task.getId().equals(id)) {
                return task;
            }
        }
        return null;
    }

    public static ArrayList<Tasks> getAllTasks() {
        return taskArrayList;
    }

    public static void deleteTask(Long id) {
        taskArrayList.removeIf(task -> task.getId().equals(id));
    }

    public static Tasks updateTask(Tasks task) {
        for (int i = 0; i < taskArrayList.size(); i++) {
            if (task.getId() == taskArrayList.get(i).getId()) {
                taskArrayList.set(i, task);
                return task;
            }
        }
        return null;
    }

    public static Tasks getTaskById(Long id) {
        for (Tasks task : taskArrayList) {
            if (task.getId() == id) {
                return task;
            }
        }
        return null;
    }

}
