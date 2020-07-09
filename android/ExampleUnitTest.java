package com.bjnews.ad;

import android.util.Log;

import com.bjnews.ad.requestBean.BidRequest;
import com.bjnews.ad.requestBean.Imp;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Example local unit test, which will execute on the development machine (host).
 *
 * @see <a href="http://d.android.com/tools/testing">Testing documentation</a>
 */
public class ExampleUnitTest {


    class Node {
        public Node(int data, Node next) {
            this.data = data;
            this.next = next;
        }

        public int data;
        public Node next;

        public int getData() {
            return data;
        }

        public void setData(int data) {
            this.data = data;
        }

        public Node getNext() {
            return next;
        }

        public void setNext(Node next) {
            this.next = next;
        }
    }

    public Node reverseLinkedList(Node head) {
        if (head == null || head.next == null) {
            return null;
        }
        Node pre = null;
        Node current;
        Node next;
        while (head.next != null) {
            next = head.next;

            current = head;
            current.next = pre;
            pre = current;

            head = next;
        }
        return pre;
    }

    @Test
    public void reverList() {
        Node node = new Node(0, null);
        Node node1 = new Node(1, node);
        Node node2 = new Node(2, node1);
        Node node3 = new Node(3, node2);
        Node node4 = new Node(4, node3);
        Node head = new Node(5, node4);

//        Node pre = null;
//        Node current;
//        Node next;
//
//        while (head.next != null) {
//
//            next = head.next;
//
//            current = head;
//            current.next = pre;
//            pre = current;
//
//            System.out.println(head.data);
//            head = next;
//        }
//        head.next = pre;
//        System.out.println("================================");
        head = reverseLinkedList(head);
        System.out.println(head.data);
        while (head.next != null) {

            System.out.println(head.data);
            head = head.next;
        }
    }

    @Test
    public void bubleSort() {
        int arr[] = {2, 7, 2, 6, 4, 7, 37, 83, 4, 8};
        for (int i = 0; i < arr.length - 1; i++) {
            for (int j = 0; j < arr.length - 1 - i; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
        for (int i = 0; i < arr.length; i++) {
            System.out.println(arr[i]);
        }
    }

    @Test
    public void addition_isCorrect() {
        assertEquals(4, 2 + 2);
        int arr[] = {4, 3, 2, 6, 4, 1, 5, 2, 3, 5, 7, 6, 9, 8, 9, 5, 4};
        int[] ints = quickSort(arr, 0, arr.length - 1);
        for (int i = 0; i < ints.length; i++) {
            System.out.println(arr[i]);
        }
    }

    public int[] quickSort(int arr[], int start, int end) {
        int cen = arr[start];
        int i = start;
        int j = end;
        while (i < j) {
            while (i < j && arr[j] > cen) {
                j--;
            }
            while (i < j && arr[i] < cen) {
                i++;
            }
            if (arr[i] == arr[j] && i < j) {
                i++;
            } else {
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
        if (i - 1 > start) arr = quickSort(arr, start, i - 1);
        if (j + 1 < end) arr = quickSort(arr, j + 1, end);
        return arr;
    }

    public void binarySearch(int arr[], int val) {
        int start = 0;
        int end = arr.length - 1;
        while (start <= end) {
            int middle = (start + end) / 2;
            if (arr[middle] > val) {
                end = middle;
            } else if (arr[middle] < val) {
                start = middle;
            }
        }
    }

    public void quickSort2(int arr[], int start, int end) {
        int i = start;
        int j = end;
        int temp = arr[i];

        while (i < j) {
            while (i < j && arr[j] > temp) {
                j--;
            }
            while (i < j && arr[i] < temp) {
                i++;
            }
            if (arr[i] == arr[j] && i < j) {
                i++;
            }
            int inTemp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
        if (j + 1 < end) {
            quickSort(arr, j + 1, end);
        }
        if (i - 1 > start) {
            quickSort(arr, start, i - 1);
        }
    }
}