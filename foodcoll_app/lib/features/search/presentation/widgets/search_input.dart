import 'package:flutter/material.dart';

/// Campo de busca utilizado na página de pesquisa.

/// Permite digitação de texto para filtrar collocations.
class SearchInput extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const SearchInput({
    Key? key,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Altura fixa conforme padrão de UI
      height: 56,
      child: TextField(
        controller: controller,
        onChanged: onChanged,

        // Estilo do texto digitado
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          color: Color(0xFF4A4F55),
        ),

        decoration: InputDecoration(
          // Texto placeholder
          hintText: 'Busque por colocações..',

          // Estilo do placeholder
          hintStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            color: Color(0xFF4A4F55),
          ),

          // Ícone de busca à direita
          suffixIcon: const Icon(
            Icons.search,
            color: Color(0xFF1FA7A6),
          ),

          // Espaçamento interno do campo
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 0, // mantém alinhamento vertical centralizado
          ),

          // Borda padrão
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFF1FA7A6),
              width: 2,
            ),
          ),

          // Borda quando o campo está focado
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFF1FA7A6),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}