import { Component, Input, OnInit } from '@angular/core';
import { Announcement } from '../announcement';

@Component({
  selector: 'app-announcement',
  templateUrl: './announcement.component.html',
  styleUrls: ['./announcement.component.scss']
})
export class AnnouncementComponent implements OnInit {

   @Input() public annonce?: Announcement;

  constructor() { }

  ngOnInit(): void {
  }

}
