import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Stack;

public class Atividade3 {

   public static void main(String[] args) {
      ArrayList<Integer> lista = new ArrayList<Integer>();
      Stack<Integer> pilha = new Stack<Integer>();
      ArrayDeque<Integer> fila = new ArrayDeque<Integer>();
      int count = 0;
      int interacao = 1;

      do {

         System.out.println(interacao + "a. interação do programa!!!\n");

         for (int i = 0; i < 5; i++) {
            lista.add(count + 1);
            count++;
            interacao = i;
         }
         
         System.out.println("Lista preenchida: " + lista);
         
         while (!lista.isEmpty()) {
            pilha.push(lista.get(interacao));
            lista.remove(interacao);
            interacao--;
         }

         System.out.println("\nPilha preenchida com os dados da lista: " + pilha);
         System.out.println("Lista vazia após exclusão dos elementos: " + lista);

         while (!pilha.isEmpty()) {
            fila.add(pilha.lastElement());
            pilha.remove(pilha.lastElement());
         }

         System.out.println("\nFila preenchida com os dados da pilha: " + fila);
         System.out.println("Pilha vazia após exclusão dos elementos: " + pilha + "\n\n");

         interacao = 2;

      } while (count < 10);
   }
}