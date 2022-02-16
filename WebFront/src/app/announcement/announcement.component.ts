import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Announcement } from '../announcement';
import {
  MatSnackBar,
  MatSnackBarHorizontalPosition,
  MatSnackBarVerticalPosition,
} from '@angular/material/snack-bar';

@Component({
  selector: 'app-announcement',
  templateUrl: './announcement.component.html',
  styleUrls: ['./announcement.component.scss']
})
export class AnnouncementComponent implements OnInit {

  @Input() public annonce?: Announcement;
  horizontalPosition: MatSnackBarHorizontalPosition = 'start';
  verticalPosition: MatSnackBarVerticalPosition = 'bottom';
      
  constructor(private router: Router, private snackBar: MatSnackBar) { }

  ngOnInit(): void { }

  openSnackBar() {
    this.snackBar.open('Inscription réussie. Vous retrouverez le cour dans votre planing. ', 'Fermer', {
      horizontalPosition: this.horizontalPosition,
      verticalPosition: this.verticalPosition,
      duration: 2000,
      panelClass: ["snackbar-color"]
    });
  }

  goToDetailPage() {
    this.router.navigate(["annonces/",this.annonce?.id,"detail"]);
  }

}
