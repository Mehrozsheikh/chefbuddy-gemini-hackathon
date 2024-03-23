import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiServices {
  final Gemini gemini;

  GeminiServices({required this.gemini});

  // MASTER AGENT FOR INGREDIENTS TO RECIPE
  Future<String> masterAgentForIngredientsToRecipe(String? ingredients,
      String numberOfPeople, String? diet, Uint8List? image) async {
    debugPrint(
        'Ingredients: $ingredients | Number of People: $numberOfPeople | Diet: $diet');
    String? ingredientsExtracted = image != null
        ? await agentForExtractingIngredientsFromRecipe(image)
        : ingredients;
    debugPrint('Ingredients Extracted: $ingredientsExtracted');
    String recipe = await agentForGenerateRecipeFromIngredients(
        ingredientsExtracted, numberOfPeople, diet);
    debugPrint('Recipe: $recipe');
    return recipe;
  }

  // MASTER AGENT FOR FOOD TO RECIPE
  Future<String> masterAgentForFoodToRecipe(
      String numberOfPeople, String? diet, Uint8List? image) async {
    String foodNameExtracted =
        await agentForExtractingFoodNameFromImage(image!);
    debugPrint('Food Name Extracted: $foodNameExtracted');
    String recipe = await agentForGenerateRecipeFromFood(
        foodNameExtracted, numberOfPeople, diet);
    debugPrint('Recipe: $recipe');
    return recipe;
  }

  // AGENT FOR EXTRACTING INGREDIENTS FROM RECIPE
  Future<String> agentForExtractingIngredientsFromRecipe(
      Uint8List image) async {
    try {
      return gemini.textAndImage(
        text: "Precisely analyze the image and extract the ingredients in it.",
        images: [image],
      ).then((value) {
        String ingredients = value!.content!.parts!.last.text!;
        debugPrint('Ingredients: $ingredients');
        return ingredients;
      }).catchError((e) {
        return 'Error: $e';
      });
    } catch (e) {
      return 'Error: $e';
    }
  }

  // AGENT FOR GENERATING RECIPE FROM INGREDIENTS
  Future<String> agentForGenerateRecipeFromIngredients(
      String? ingredients, String numberOfPeople, String? diet) async {
    try {
      return gemini
          .text(
        "You are expert in cooking. You have to make a recipe with the following ingredients: $ingredients. The recipe should be for $numberOfPeople people {${diet != null ? 'and should be $diet' : ''}}. You have to write Recipe Name, Ingredients, Detailed Instructions, and Nutritional Information in well-structured markdown format.",
      )
          .then((value) {
        String recipe = value!.content!.parts!.last.text!;
        debugPrint('Recipe: $recipe');
        return recipe;
      }).catchError((e) {
        return 'Error: $e';
      });
    } catch (e) {
      return 'Error: $e';
    }
  }

  // AGENT FOR EXTRACTING FOOD NAME FROM IMAGE
  Future<String> agentForExtractingFoodNameFromImage(Uint8List image) async {
    try {
      return gemini.textAndImage(
        text: "Precisely analyze the image and extract the food name in it.",
        images: [image],
      ).then((value) {
        String foodName = value!.content!.parts!.last.text!;
        debugPrint('Food Name: $foodName');
        return foodName;
      }).catchError((e) {
        return 'Error: $e';
      });
    } catch (e) {
      return 'Error: $e';
    }
  }

  // AGENT FOR GENERATING RECIPE FROM FOOD
  Future<String> agentForGenerateRecipeFromFood(
      String? foodName, String numberOfPeople, String? diet) async {
    debugPrint('Food Name: $foodName');
    try {
      return gemini
          .text(
        "You are expert in cooking. You have to make a recipe with the following food: $foodName. The recipe should be for $numberOfPeople people {${diet != null ? 'and should be $diet' : ''}}. You have to write Ingredients, Detailed Instructions, and Nutritional Information.",
      )
          .then((value) {
        String recipe = value!.content!.parts!.last.text!;
        debugPrint('Recipe: $recipe');
        return recipe;
      }).catchError((e) {
        return 'Error: $e';
      });
    } catch (e) {
      return 'Error: $e';
    }
  }
}
