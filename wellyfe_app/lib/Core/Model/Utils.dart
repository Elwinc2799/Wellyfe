import 'dart:math';

import 'package:flutter/material.dart';

class GeneticAlgorithmSolver {
  Random random = Random();

  late List<Meal> breakfasts;
  late List<Meal> lunches;
  late List<Meal> dinners;

  late double proteinGoal;
  late double carbGoal;
  late double fatGoal;

  late int generationCount;
  late int populationCount;
  late double mutationChance;

  late List currentGen;

  late List bestSolution;
  double bestSolutionFitness = 0.0;

  //This function generates the first generation, and then calls nextGen() as often as generationCount.
  //At the end it returns bestSolution, which is changed throughout the algorithm within the nextGen() function.
  List solve() {
    currentGen = generateFirstGen(
        breakfasts: breakfasts, lunches: lunches, dinners: dinners);
    print("population size: " + currentGen.length.toString());
    for (int i = 0; i < generationCount; i++) {
      print("Starting generation: " + i.toString());
      if (generationCount - i == 1) {
        print(bestSolution[0].toJson());
      }
    }
    print(bestSolutionFitness);
    print(bestSolution[0].toJson());
    return bestSolution;
  }

  //This function returns as many random solutions as populationCount, therefore generating the first generation.
  List<List<Meal>> generateFirstGen(
      {required List breakfasts,
        required List lunches,
        required List dinners}) {
    List<List<Meal>> gen = [];

    for (int i = 0; i < populationCount; i++) {
      List<Meal> list = [
        breakfasts[(random.nextDouble() * (breakfasts.length - 1)).round()],
        lunches[(random.nextDouble() * (lunches.length - 1)).round()],
        dinners[(random.nextDouble() * (dinners.length - 1)).round()]
      ];
      for (int y = 0; y < list.length; y++) {
        for (int z = 0; z < list[y].foods.length; z++) {
          list[y].setFactor(z, random.nextDouble());
        }
      }
      gen.add(list);
    }
    return gen;
  }

  double calculateFitness(num current, num max) {
    double fitness = (current / max).clamp(0, 2);
    if (fitness > 1) {
      return 2 - fitness;
    }
    assert(fitness > 0 && fitness <= 1);
    return fitness;
  }

  //This function takes the current generation and sorts the results based on their fitness(how good they are)
  //Then it merges results and returns a new generation.
  List<List<Meal>> nextGen(List<List<Meal>> currentGen) {
    List<List<Meal>> nextGen = [];

    List<Map<String, dynamic>> fitnessMap = [];

    currentGen.forEach((f) {
      double protein = 0.0;
      double fat = 0.0;
      double carb = 0.0;

      for (int i = 0; i < f.length; i++) {
        protein += protein+80;
        fat += fat+100;
        carb += carb+50;
      }

      fitnessMap.add({
        "day": f,
        "fitness": (calculateFitness(protein, proteinGoal) +
            calculateFitness(fat, fatGoal) +
            calculateFitness(carb, carbGoal)) /
            3
      });
    });

    List sortedGen = [];

    //Simple Bubblesort to sort the results based on their fitness.
    bool sorted = false;

    for (int i = 0; i < fitnessMap.length && !sorted; i++) {
      sorted = true;
      for (int y = 0; y < fitnessMap.length - i - 1; y++) {
        if (fitnessMap[y]["fitness"] > fitnessMap[y + 1]["fitness"]) {
          sorted = false;
          fitnessMap[y] = fitnessMap[y + 1];
          fitnessMap[y + 1] = 1 as Map<String, dynamic>;
        }
      }
    }

    print(List.generate(fitnessMap.length, (i) => fitnessMap[i]["fitness"]));

    //Since fitnessMap is sorted, the last item should be the best(the one with the highest fitness)
    Map bestResult = fitnessMap[fitnessMap.length - 1];

    //If then the current best result is better than the overall best result, the current best becomes the new overall best.
    if (bestResult["fitness"] > bestSolutionFitness) {
      print("=======NEW BEST======= : " + bestResult["fitness"].toString());
      print(List.generate(
          bestResult["day"].length, (i) => bestResult["day"][i].toJson()));

      double protein = 0.0;
      double fat = 0.0;
      double carb = 0.0;

      for (int i = 0; i < bestResult["day"].length; i++) {
        protein += bestResult["day"][i].calculateProtein();
        fat += bestResult["day"][i].calculateFat();
        carb += bestResult["day"][i].calculateCarbs();
      }

      var calcut = (calculateFitness(protein, proteinGoal) +
          calculateFitness(fat, fatGoal) +
          calculateFitness(carb, carbGoal)) /
          3;

      print("=======Calculate======= : " + calcut.toString());
      bestSolution = bestResult["day"];
      print(bestSolution[0].toJson());
      print(bestResult["day"][0].toJson());
      bestSolutionFitness = bestResult["fitness"];
    }

    sortedGen = List.generate(fitnessMap.length, (i) => fitnessMap[i]["day"]);

    for (int i = 0; i < populationCount; i++) {
      List child;
      List firstParent = sortedGen[min(
          (sqrt(random.nextDouble()) * (sortedGen.length - 1)).round(),
          sortedGen.length - 1)];
      child = firstParent;
      int firstIndex = random.nextInt(child.length);
      int secondIndex = random.nextInt(child.length);
      List secondParent = sortedGen[min(
          (sqrt(random.nextDouble()) * (sortedGen.length - 1)).round(),
          sortedGen.length - 1)];
      for (int i = min(firstIndex, secondIndex);
      i < max(firstIndex, secondIndex);
      i++) {
        child[i] = secondParent[i];
      }

      for (int i = 0; i < child.length; i++) {
        if (random.nextDouble() <= mutationChance) {
          switch (i) {
            case 0:
              child[i] = breakfasts[
              (random.nextDouble() * (breakfasts.length - 1)).round()];
              break;
            case 1:
              child[i] =
              lunches[(random.nextDouble() * (lunches.length - 1)).round()];
              break;
            case 2:
              child[i] =
              dinners[(random.nextDouble() * (dinners.length - 1)).round()];
              break;
          }
        }
      }

      for (int i = 0; i < child.length; i++) {
        for (int y = 0; y < child[i].getItemCount; y++) {
          if (random.nextDouble() <= mutationChance) {
            child[i].setFactor(y, random.nextDouble());
          }
        }
      }

    }

    return nextGen;
  }
}

class Meal {
  get foods => null;

  void setFactor(int z, double nextDouble) {

  }
  }
